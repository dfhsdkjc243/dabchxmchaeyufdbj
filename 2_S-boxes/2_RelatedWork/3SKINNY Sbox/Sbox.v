module Sbox(
input clk,
input [1:0] ina,
input [1:0] inb,
input [1:0] inc,
input [1:0] ind,
output [3:0] out0,  //gift_y4
output [3:0] out1

);

wire a0,a1,b0,b1,c0,c1,d0,d1;


reg x0,x1,x2,x3,x4,x5,x6,x7;
reg y0,y1,y2,y3,y4,y5,y6,y7;
reg z0,z1,z2,z3,z4,z5,z6,z7;
reg t0,t1,t2,t3,t4,t5,t6,t7;

wire outx0, outx1;
wire outy0, outy1;
wire outz0, outz1;
wire outt0, outt1;

assign {a1,a0} = ina;
assign {b1,b0} = inb;
assign {c1,c0} = inc;
assign {d1,d0} = ind;

always @(posedge clk) begin	
	x0 <= b0 ^ c0&d1 ^ a0&b0&c0 ^ b0&c0&d1;
	x1 <= a0 ^ a0&b1 ^ a0&c0 ^ b1&d0 ^ a0&b1&c0 ^ b1&c0&d0;
	x2 <= c0 ^ a1&c0 ^ a1&b0&c0 ^ b0&c0&d0;
	x3 <= b1 ^ d1 ^ a1&b1 ^ b1&d1 ^ c0&d1 ^ a1&b1&c0 ^ b1&c0&d1;
	x4 <= c1 ^ a0&b0 ^ a0&d0 ^ b0&d0 ^ a0&b0&c1 ^ b0&c1&d0;
	x5 <= a0 ^ c1 ^ a0&c1 ^ a0&d1 ^ a0&b1&c1 ^ b1&c1&d1;
	x6 <= a1&b0 ^ a1&d1 ^ b0&d1 ^ a1&b0&c1 ^ b0&c1&d1;
	x7 <= c1 ^ d0 ^ a1&c1 ^ a1&d0 ^ a1&b1&c1 ^ b1&c1&d0;
	
	y0 <= a0&b0 ^ a0&c1 ^ c1&d1 ^ b0&c1&d1;
	y1 <= a1&c0 ^ b0&c0&d0;
	y2 <= a1&b0 ^ a1&c0 ^ b0&c0 ^ b0&d1 ^ b0&c0&d1;
	y3 <= c1 ^ d0 ^ a1&c1 ^ b0&c1 ^ b0&d0 ^ c1&d0 ^ b0&c1&d0;
	y4 <= a0&c0 ^ b1&c0 ^ c0&d0 ^ b1&c0&d0;
	y5 <= a0 ^ d1 ^ a0&c0 ^ b1&d1 ^ c0&d1 ^ b1&c0&d1;
	y6 <= c1 ^ a0&b1 ^ a0&c1 ^ b1&c1 ^ b1&d0 ^ b1&c1&d0;
	y7 <= a1 ^ a1&b1 ^ a1&c1 ^ b1&c1&d1;
	
	z0 <= 1 ^ d1 ^ b0&c0;
	z1 <= b0 ^ c1 ^ d0 ^ b0&c1;
	z2 <= 0;
	z3 <= 0;
	z4 <= c0 ^ b1&c0;
	z5 <= b1 ^ b1&c1;
	z6 <= 0;
	z7 <= 0;
	
	t0 <= 1 ^ b0 ^ d1 ^ c0&d1;
	t1 <= c1 ^ c1&d1;
	t2 <= 0;
	t3 <= 0;
	t4 <= a0 ^ b0 ^ d0 ^ c1&d0;
	t5 <= a1 ^ c0 ^ c0&d0;
	t6 <= 0;
	t7 <= 0;
	





end


assign outx0 = x0 ^ x1 ^ x2 ^ x3;
assign outx1 = x4 ^ x5 ^ x6 ^ x7;
assign outy0 = y0 ^ y1 ^ y2 ^ y3;
assign outy1 = y4 ^ y5 ^ y6 ^ y7;
assign outz0 = z0 ^ z1;
assign outz1 = z4 ^ z5;
assign outt0 = t0 ^ t1;
assign outt1 = t4 ^ t5;

assign out0 = {outt0, outz0, outy0, outx0};
assign out1 = {outt1, outz1, outy1, outx1};


endmodule
