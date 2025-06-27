module demux_14(din,sel,dout);
input din;
input [1:0] sel;
output reg [3:0] dout;
always @(*) begin
dout = 4'b0000;
case (sel)
2'b00: dout[0] = din;
2'b01: dout[1] = din;
2'b10: dout[2] = din;
2'b11: dout[3] = din;
endcase
end
endmodule
//////////////tb///////////////
module tb_demux_14();
reg din;
reg [1:0] sel;
wire [3:0] dout;
demux_14 d1 (din,sel,dout);
initial begin
din = 1; sel = 2'b00; #100;
din = 1; sel = 2'b01; #100;
din = 1; sel = 2'b10; #100;
din = 1; sel = 2'b11; #100;
din = 0; sel = 2'b00; #100;
din = 0; sel = 2'b01; #100;
din = 0; sel = 2'b10; #100;
din = 0; sel = 2'b11;
end
endmodule

