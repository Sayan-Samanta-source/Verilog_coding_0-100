module t_ff (clk,rst,t,q);
input clk;
input rst;
input t;
output reg q;
always @(posedge clk or posedge rst) begin
if (rst)
q <= 0;
else if (t)
q <= ~q;
else
q <= q;
end
endmodule
//////////tb///////////
module t_ff_tb();
reg clk;
reg rst;
reg t;
wire q;
t_ff t1(clk,rst,t,q);
always #5 clk = ~clk;
initial begin
clk=1; rst=1; t=1'bx; #100;
clk=1; rst=0; t=0; #100;
clk=1; rst=0; t=1; #100;
clk=0; rst=1'bx; t=1'bx;
end
endmodule
