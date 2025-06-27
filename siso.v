/////siso register//////
module siso_shift_register (clk,rst,sin,sout);
input clk,rst,sin;
output reg sout;
reg [3:0] shift_reg;
always @(posedge clk or posedge rst) begin
if (rst)
shift_reg <= 4'b0000;   
else begin
shift_reg <= {shift_reg[2:0], sin}; 
end
end
always @(*) begin
sout = shift_reg[3]; 
end
endmodule
////test bench////
module tb_siso_shift_register();
reg clk,rst,sin;
wire sout;
siso_shift_register s1(clk,rst,sin,sout);
always #5 clk = ~clk; 
initial begin 
clk = 0;
rst = 1;
sin = 0; #10;
rst = 0;
sin = 1; #10;
sin = 0; #10;
sin = 1; #10;
sin = 1;
end
endmodule
