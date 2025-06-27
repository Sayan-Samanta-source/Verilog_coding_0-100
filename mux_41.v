module mux_41(in,sel,out);
input  wire[1:0] sel;
input  wire[3:0] in;
output reg out;
always @(*) begin
case (sel)
2'b00: out = in[0];
2'b01: out = in[1];
2'b10: out = in[2];
2'b11: out = in[3];
endcase
end
endmodule
//////////tb//////////////
module tb_mux_41();
reg [1:0] sel;
reg [3:0] in;
wire out;
mux_41 m1 (in,sel,out);
initial
begin
in = 4'b1010; sel = 2'b00; #100;
in = 4'b1010; sel = 2'b01; #100;
in = 4'b1010; sel = 2'b10; #100;
in = 4'b1010; sel = 2'b11; #100;
in = 4'b1101; sel = 2'b00; #100;
in = 4'b1101; sel = 2'b01; #100;
in = 4'b1101; sel = 2'b10; #100;
in = 4'b1101; sel = 2'b11; 
end
endmodule
