module counter_4(clk,reset,load,data_in,count);
input clk;
input reset;
input load;
input [3:0] data_in;
output reg [3:0] count;
always @(posedge clk) begin
if (reset)
count <= 4'b0000;
else if (load)
count <= data_in;
else
count <= count + 1;
end
endmodule
////////////////////tb/////////////////
module tb_counter_4();
reg clk;
reg reset;
reg load;
reg [3:0] data_in;
wire [3:0] count;
counter_4 c1 (clk,reset,load,data_in,count);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
reset = 1; load = 0; data_in = 4'b0000; #100;
reset = 0;#100;
load = 1; data_in = 4'b1010; #100;
load = 0; #100;
reset = 1; #100;
reset = 0; 
end
endmodule
