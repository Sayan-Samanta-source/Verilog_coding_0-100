module shift_register_4bit(clk,rst,en,serial_in,q);
input wire clk;
input wire rst;
input wire en;
input wire serial_in;
output reg [3:0] q;
always @(posedge clk or posedge rst) begin
if (rst)
q <= 4'b0000;  
else if (en)
q <= {q[2:0], serial_in}; 
end
endmodule
////test bench ////
module tb_shift_register_4bit;
reg clk;
reg rst;
reg en;
reg serial_in;
wire [3:0] q;
shift_register_4bit s1 (clk,rst,en,serial_in,q);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
rst = 1; en = 0; serial_in = 0; #10;
rst = 0; en = 1;
serial_in = 1; #10; // q = 0001
serial_in = 0; #10; // q = 0010
serial_in = 1; #10; // q = 0101
serial_in = 1;
en = 0; serial_in = 0; 
end
endmodule
