module mod12_upcounter (clk,reset,load,load_val,count);
input clk;
input reset;
input load;
input [3:0] load_val;
output reg [3:0] count;
always @(posedge clk) begin
if (reset)
count <= 0;
else if (load)
count <= load_val;
else if (count == 4'd11)
count <= 0; 
else
count <= count + 1;
end
endmodule
////////////////////tb//////////////
module tb_mod12_upcounter();
reg clk, reset, load;
reg [3:0] load_val;
wire [3:0] count;
mod12_upcounter m1 (clk,reset,load,load_val,count);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
reset = 1; load = 0; load_val = 4'b0000; #100;
reset = 0; #100;
load = 1;
load_val = 4'd7;#100;
load = 0;#100;
reset = 1; #100;
reset = 0;
end
endmodule
