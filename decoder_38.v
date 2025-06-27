module decoder_38(in,e,out);
input [2:0]in;
input e;
output reg [7:0]out;
always @(*) begin
if (e)
out = 00000001 << in;
else 
out = 00000000;
end 
endmodule 

///////////////////tb///////////

module tb_decoder_38();
reg [2:0]IN;
reg E;
wire [7:0]OUT;
decoder_38 d1 (IN,E,OUT);
initial 
begin
 E = 1;
 for (IN = 0; IN < 8; IN = IN + 1)
 #10;
 E = 0;
 IN = 3'b011;
 #10;
 IN = 3'b111;
end 
endmodule 