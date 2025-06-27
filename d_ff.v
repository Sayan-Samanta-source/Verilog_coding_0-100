module d_ff (clk,d,q);
input clk;
input d;
output reg q;
always @(posedge clk) begin
q <= d;
end
endmodule
//////////////tb/////////////
module tb_d_ff();
reg clk;
reg d;
wire q;
d_ff d1 (clk,d,q);
initial begin
clk = 0;
forever #5 clk = ~clk; 
end
initial begin
d=0; clk=0; #100;
d=0; clk=1; #100;
d=1; clk=0; #100;
d=1; clk=1;
end
endmodule
