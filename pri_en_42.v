module pri_en_42(in,out,valid);
input  [3:0] in;
output reg [1:0] out;
output reg valid;
always @(*) begin
valid = 1'b1;
casex (in)
4'b1xxx: out = 2'b11;
4'b01xx: out = 2'b10;
4'b001x: out = 2'b01; 
4'b0001: out = 2'b00; 
default: begin
out = 2'b00;
valid = 1'b0;
end
endcase
end
endmodule
///////////tb/////////
module tb_pri_en_42();
reg [3:0] in;
wire [1:0] out;
wire valid;
pri_en_42 p2 (in,out,valid);
initial begin
in = 4'b0000; #100;
in = 4'b0001; #100;
in = 4'b0010; #100;
in = 4'b0011; #100;
in = 4'b0100; #100;
in = 4'b0101; #100;
in = 4'b0110; #100;
in = 4'b0111; #100;
in = 4'b1000; #100;
in = 4'b1001; #100;
in = 4'b1010; #100;
in = 4'b1011; #100;
in = 4'b1100; #100;
in = 4'b1101; #100;
in = 4'b1110; #100;
in = 4'b1111;
end
endmodule
