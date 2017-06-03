//Listing 10.4
module mouse
   (
    input wire clk, reset,
    inout wire ps2d, ps2c,
    output wire [8:0] xm,
	 output wire [8:0] ym,
    output wire btnm,
    output reg  m_done_tick
   );

   // constant declaration
   localparam STRM=8'hEA; // Set Stream Mode EA
	localparam ENDR=8'hF4; // Enable Data Rep F4

   // symbolic state declaration
   localparam [3:0]
      init1 = 4'b0000,
      init2 = 4'b0001,
      init3 = 4'b0010,
      init4 = 4'b1001,
      init5 = 4'b1000,
      pack1 = 4'b0011,
      pack2 = 4'b0100,
      pack3 = 4'b0101,
      done  = 4'b0110;

   // signal declaration
	reg [7:0] datain;
   reg [3:0] state_reg, state_next;
   wire [7:0] rx_data;
   reg wr_ps2;
   wire rx_done_tick, tx_done_tick;
   reg [8:0] x_reg, x_next;
	reg [8:0] y_reg, y_next;
   reg btn_reg, btn_next;
	
   // body
   // instantiation
   ps2_rxtx ps2_unit
      (.clk(clk), .reset(reset), .wr_ps2(wr_ps2),
       .din(ENDR), .dout(rx_data), .ps2d(ps2d), .ps2c(ps2c),
       .rx_done_tick(rx_done_tick),
       .tx_done_tick(tx_done_tick)
		 );

   // body
   // FSMD state and data registers
   always @(posedge clk, posedge reset)
      if (reset)
         begin
            state_reg <= init1;
            x_reg <= 0;
				y_reg <= 0;
            btn_reg <= 0;
         end
      else
         begin
            state_reg <= state_next;
            x_reg <= x_next;
				y_reg <= y_next;
            btn_reg <= btn_next;
         end

   // FSMD next-state logic
   always @*
   begin
      state_next = state_reg;
      wr_ps2 = 1'b0;
      m_done_tick = 1'b0;
      x_next = x_reg;
		y_next = y_reg;
      btn_next = btn_reg;
      case (state_reg)
         init1:
            begin
					datain = STRM;
               wr_ps2 = 1'b1;
               state_next = init2;
            end
         init2:  // wait for send to complete
            if (tx_done_tick)
               state_next = init3;
         init3:  // wait for acknowledge packet
				begin
				datain = ENDR;
            if (rx_done_tick)
					begin
					wr_ps2 = 1'b1;
               state_next = init4;
					end
				end
			init4:
				if (tx_done_tick)
               state_next = init5;
			init5:
				if (rx_done_tick)
               state_next = pack1;
         pack1:  // wait for 1st data packet
            if (rx_done_tick)
               begin
                  state_next = pack2;
                  x_next[8] = rx_data[4];
						y_next[8] = rx_data[5];
                  btn_next =  rx_data[0];
               end
         pack2:  // wait for 2nd data packet
            if (rx_done_tick)
               begin
                  state_next = pack3;
                  x_next[7:0] = rx_data;
               end
         pack3:  // wait for 3rd data packet
            if (rx_done_tick)
               begin
                  state_next = done;
						y_next[7:0] = rx_data;
               end
         done:
            begin
               m_done_tick = 1'b1;
               state_next = pack1;
            end
      endcase
   end
   // output
   assign xm = x_reg;
	assign ym = y_reg;
   assign btnm = btn_reg;

endmodule
