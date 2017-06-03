//Listing 10.5
module mouse_led
   (
    input wire clk, reset,
    inout wire ps2d, ps2c,
    output wire [9:0] mouse_x,
	 output wire [8:0] mouse_y,
	 output wire btnm
   );

   // signal declaration
   reg [9:0] p_reg;
   wire [9:0] p_next;
   wire [8:0] xm, ym;
   wire m_done_tick;
	reg [8:0] x_mov;
	reg [8:0] y_mov;
	
   // body
   // instantiation
   mouse mouse_unit
      (.clk(clk), .reset(reset), .ps2d(ps2d), .ps2c(ps2c),
       .xm(xm), .ym(ym), .btnm(btnm),
       .m_done_tick(m_done_tick));

	mouse_controller controller
		(.clk(clk),
		 .xm(x_mov),
		 .ym(y_mov),
		 .mouse_x(mouse_x),
		 .mouse_y(mouse_y));

   always @*
      begin
		if(m_done_tick)begin
		x_mov = xm;
		y_mov = ym;
		end
		else
		begin
		x_mov = 9'b0;
		y_mov = 9'b0;
		end
		end

endmodule
