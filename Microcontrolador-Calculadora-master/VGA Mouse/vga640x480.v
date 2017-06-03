`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:12 09/29/2016 
// Design Name: 
// Module Name:    vga640x480 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vga640x480(
    input  wire clk,
	 input  wire [2:0] redin,
	 input  wire [2:0] greenin,
	 input  wire [1:0] bluein,
	 output reg [9:0] hc,
    output reg [9:0] vc,
	 output wire hsync,
	 output wire vsync,
    output reg [2:0] red,
    output reg [2:0] green,
    output reg [1:0] blue
    );
	 
// Constantes de la estructura de video
parameter hpixels = 800;// Pixeles horizontales
parameter vlines = 521; // Lineas verticales
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// Fin del    "back-porch"  horizontal
parameter hfp = 784; 	// Inicio del "front-porch" horizontal
parameter vbp = 31; 		// Fin del    "back-porch"  vertical
parameter vfp = 511; 	// Inicio del "front-porch" vertical
// Zona horizontal: 784 - 144 = 640
// Zona vertical: 511 - 31 = 480

// Las asignaciones solo pueden ser "non-blocking": <=
always @(posedge clk)
begin
	if (hc < hpixels - 1)					// Se cuenta hasta los 800 pixeles (fin de la línea)
		hc <= (hc + 1'b1);
	else											// Se llega al fin de la línea
	begin
		hc <= 0;
		if (vc < vlines - 1)
			vc <= (vc + 1'b1);
		else
			vc <= 0;
	end
end

// Se generan los pulsos de sincronización (activo en 0)
assign hsync = (hc < hpulse) ? 1'b0:1'b1;
assign vsync = (vc < vpulse) ? 1'b0:1'b1;

// Se dibuja en pantalla 
always @(*)
begin
	if (vc >= vbp && vc < vfp)					// Si está en el rango vertical
	begin
		if (hc >= hbp && hc < (hbp+640))		// Si está en el rango horizontal
		begin
			red = redin;
			green = greenin;
			blue = bluein;
		end
		else											// afuera del rango horizontal negro
		begin
			red = 0;
			green = 0;
			blue = 0;
		end
	end
	else												// afuera del rango vertical negro
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule
