////piso register////
module piso_register (clk,reset,load,parallel_in,serial_out);
input clk,reset,load;
input [3:0] parallel_in;
output reg serial_out;
reg [3:0] shift_reg;
always @(posedge clk or posedge reset) begin
if (reset)
shift_reg <= 4'b0000;
else if (load)
shift_reg <= parallel_in;
else
shift_reg <= {shift_reg[2:0], 1'b0};
end
always @(*) begin
serial_out = shift_reg[3]; 
end
endmodule
////test bench////
module tb_piso_register();
reg clk, reset, load;
reg [3:0] parallel_in;
wire serial_out;
piso_register p2 (clk,reset,load,parallel_in,serial_out);
initial clk = 0;
always #5 clk = ~clk; 
initial begin 
reset = 1; load = 0; parallel_in = 4'b0000; #100;
reset = 0; load = 0; parallel_in = 4'b1011; #100;
reset = 0; load = 1; parallel_in = 4'b1011;
end
endmodule
