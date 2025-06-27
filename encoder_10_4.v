module encoder_10_4(in,out,valid);
input  [9:0] in;
output reg [3:0] out;
output reg valid;
always @(*) begin
valid = 1'b1;
casez (in)
10'b1xxxxxxxxx: out = 4'b1001;
10'b01xxxxxxxx: out = 4'b1000;
10'b001xxxxxxx: out = 4'b0111;
10'b0001xxxxxx: out = 4'b0110;
10'b00001xxxxx: out = 4'b0101;
10'b000001xxxx: out = 4'b0100;
10'b0000001xxx: out = 4'b0011;
10'b00000001xx: out = 4'b0010;
10'b000000001x: out = 4'b0001;
10'b0000000001: out = 4'b0000;
default: begin
out = 4'd0;
valid = 1'b0;
end
endcase
end
endmodule
//////////////tb////////////
module tb_encoder_10_4();
reg  [9:0] in;
wire [3:0] out;
wire valid;
encoder_10_4 e2 (in,out,valid);
initial 
begin
in = 10'b0000000000; #100;
in = 10'b0000000001; #100;
in = 10'b0000000010; #100;
in = 10'b0000000100; #100;
in = 10'b0000001000; #100;
in = 10'b0000010000; #100;
in = 10'b0000100000; #100;
in = 10'b0001000000; #100;
in = 10'b0010000000; #100;
in = 10'b0100000000; #100;
in = 10'b1000000000; #100;
in = 10'b0001100000;
end
endmodule
