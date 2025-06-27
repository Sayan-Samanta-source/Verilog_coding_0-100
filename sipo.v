////// sipo register////
module sipo_register(clk,rst,serial_in,parallel_out);
input clk;
input rst;
input serial_in;
output reg [3:0] parallel_out;
always @(posedge clk or posedge rst) begin
if (rst)
parallel_out <= 4'b0000;
else
parallel_out <= {parallel_out[2:0], serial_in};
end
endmodule
/////test bench/////
module tb_sipo_register;
reg clk;
reg rst;
reg serial_in;
wire [3:0] parallel_out;
sipo_register s1(clk,rst,serial_in,parallel_out);
always #5 clk = ~clk;
initial begin
clk = 0;
rst = 1;
serial_in = 0;
#10 rst = 0;
#10 serial_in = 1;
#10 serial_in = 0;
#10 serial_in = 1;
#10 serial_in = 1; 
end
endmodule
