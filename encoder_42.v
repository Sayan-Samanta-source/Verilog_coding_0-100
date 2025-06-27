module encoder_42(din,y,valid);
input  [3:0] din;
output reg [1:0] y;
output reg valid;
always @(*) begin
valid = 1'b1;
case (din)
4'b0001: y = 2'b00;
4'b0010: y = 2'b01;
4'b0100: y = 2'b10;
4'b1000: y = 2'b11;
default: begin
y = 2'b00;
valid = 1'b0; 
end
endcase
end
endmodule
/////tb /////////
module tb_encoder_42();
reg [3:0]din;
wire [1:0] y;
wire valid;
encoder_42 f1(din,y,valid);
initial 
begin
din = 4'b0001; #100;
din = 4'b0010; #100;
din = 4'b0100; #100;
din = 4'b1000;
end 
endmodule
