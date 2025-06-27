module sr_ff(sr,clk,q,qb);
input[1:0]sr;
input clk;
output q,qb;
reg q,qb;
always@(posedge clk) begin
case(sr)
00: q=q;
01: q=0;
10: q=1;
11: q=1'bx;
endcase
qb = ~q;
end
endmodule
/////////////tb//////////
module tb_sr_ff();
reg[1:0]sr;
reg clk;
wire q,qb;
sr_ff f1 (sr,clk,q,qb);
always #100  clk = ~clk;
initial 
begin
sr = 00; #100
sr = 01; #100
sr = 10; #100
sr = 11;
end
endmodule 