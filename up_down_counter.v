module up_down_counter(clk,rst,load,data_in,up_down,count);
input clk;
input rst;
input load;
input [3:0] data_in;
input up_down;
output reg [3:0] count;
always @(posedge clk) begin
if (rst)
count <= 4'b0000;
else if (load)
count <= data_in;
else if (up_down)
count <= count + 1;
else
count <= count - 1;
end
endmodule
////tb/////////
module tb_up_down_counter();
reg clk, rst, load, up_down;
reg [3:0] data_in;
wire [3:0] count;
up_down_counter t1 (clk,rst,load,data_in,up_down,count);
always #5 clk = ~clk;
initial begin
clk = 0; rst = 1; load = 0; data_in = 4'b0000; up_down = 1;
#100 rst = 0;
#100 load = 1; data_in = 4'b1010;
#100 load = 0;
up_down = 1;
#100;
up_down = 0;
#100;
rst = 1;
#100 rst = 0;
end
endmodule 