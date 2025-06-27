/////ring counter/////
module ring_counter (clk,rst,out);
input clk,rst;
output reg [3:0] out;
always @(posedge clk or posedge rst) begin
if (rst)
out <= 4'b1000;  
else
out <= {out[2:0], out[3]}; 
end
endmodule
////test bench////
module tb_ring_counter();
reg clk;
reg rst;
wire [3:0] out;
ring_counter r1 (clk,rst,out);
always #5 clk = ~clk;
initial begin
clk = 0;
rst = 1; #100;
rst = 0; 
end
endmodule
