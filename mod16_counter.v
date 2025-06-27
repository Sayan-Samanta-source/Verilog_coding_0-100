module mod16_counter (clk,reset,count);
input clk;
input reset;
output reg [3:0] count;
always @(posedge clk or posedge reset) begin
if (reset)
count <= 4'b0000;
else
count <= count + 1;
end
endmodule
/////////tb////////////
module tb_mod16_counter();
reg clk;
reg reset;
wire [3:0] count;
mod16_counter m1(clk,reset,count);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
reset = 1; #100;
reset = 0;
end
endmodule
