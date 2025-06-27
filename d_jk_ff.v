//d ff//
module DFF (clk,d,q);
input clk;
input d;
output reg q;
always @(posedge clk)
q <= d;
endmodule
// d-jk ff//
module JKFF_using_DFF (clk,j,k,q);
input clk;
input j;
input k;
output q;
wire d;
wire q_int;
assign d = (j & ~q_int) | (~k & q_int);
DFF dff_inst (.clk(clk),.d(d),.q(q_int));
assign q = q_int;
endmodule
/////tb/////
module tb_JKFF_using_DFF();
reg clk, j, k;
wire q;
JKFF_using_DFF j1 (clk,j,k,q);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
clk=0; j=0; k=0; #100;
clk=0; j=0; k=1; #100;
clk=0; j=1; k=0; #100;
clk=0; j=1; k=1; #100;
clk=1; j=0; k=0; #100;
clk=1; j=0; k=1; #100;
clk=1; j=1; k=0; #100;
clk=1; j=1; k=1;
end
endmodule
