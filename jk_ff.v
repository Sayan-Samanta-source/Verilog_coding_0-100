module jk_ff(jk,clk,q,qb);
input[1:0]jk;
input clk;
output q,qb;
reg q,qb;
always@(posedge clk) begin
case(jk)
00: q=q;
01: q=0;
10: q=1;
11: q=~q;
endcase
qb = ~q;
end
endmodule
/////////////tb//////////
module tb_jk_ff();
reg[1:0]jk;
reg clk;
wire q,qb;
jk_ff f1 (jk,clk,q,qb);
always #100  clk = ~clk;
initial 
begin
jk = 00; #100
jk = 01; #100
jk = 10; #100
jk = 11;
end
endmodule
