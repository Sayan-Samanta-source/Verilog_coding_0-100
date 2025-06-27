module pri_en_83 (in,out,valid);
input [7:0] in;
output reg [2:0] out;
output reg valid;
always @(*) begin
valid = 1'b1;
casex (in)
8'b1xxxxxxx: out = 3'b111;
8'b01xxxxxx: out = 3'b110;
8'b001xxxxx: out = 3'b101;
8'b0001xxxx: out = 3'b100;
8'b00001xxx: out = 3'b011;
8'b000001xx: out = 3'b010;
8'b0000001x: out = 3'b001;
8'b00000001: out = 3'b000;
default: begin
out = 3'b000;
valid = 1'b0;
end
endcase
end
endmodule
/////////tb/////////////
module tb_pri_en_83();
reg [7:0] in;
wire [2:0] out;
wire valid;
pri_en_83 p1 (in,out,valid);
initial begin
in = 8'b00000000; #100;
in = 8'b00000001; #100;
in = 8'b00000010; #100;
in = 8'b00000100; #100;
in = 8'b00001000; #100;
in = 8'b00010000; #100;
in = 8'b00100000; #100;
in = 8'b01000000; #100;
in = 8'b10000000; #100;
in = 8'b10101010; #100;
in = 8'b01110000; #100;
in = 8'b00001111; 
end
endmodule

