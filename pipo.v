/// pipo register////
module pipo_register(clk,load,d_in,d_out);
input clk;
input load;
input [3:0] d_in;
output reg [3:0] d_out;
always @(posedge clk) begin
if (load)
d_out <= d_in;
end
endmodule
/////test bench////
module tb_pipo_register();
reg clk;
reg load;
reg [3:0] d_in;
wire [3:0] d_out;
pipo_register p1(clk,load,d_in,d_out);
always #5 clk = ~clk;
initial begin
clk = 0;
load = 0;
d_in = 4'b0000;
#10 d_in = 4'b1010; load = 1;
#10 load = 0;
#10 d_in = 4'b1100;
#10 load = 1;
#10 d_in = 4'b1111;
end
endmodule
