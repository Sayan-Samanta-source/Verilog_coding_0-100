module mux41_d_t (D,SEL,Y);
input [3:0]D;
input[1:0]SEL;
output Y;
wire [3:0] DEC_out;///// decoder out
wire [3:0] BUFF_out;//////buffer out
/////2:4 decoder////
assign DEC_out[0]= ~SEL[1]&~SEL[0];
assign DEC_out[1]= ~SEL[1]&SEL[0];
assign DEC_out[2]= SEL[1]&~SEL[0];
assign DEC_out[3]= SEL[1]&SEL[0];
/////////tristate buffer 
assign BUFF_out[0]= DEC_out[0]?D[0]:1'bz;
assign BUFF_out[1]= DEC_out[1]?D[1]:1'bz;
assign BUFF_out[2]= DEC_out[2]?D[2]:1'bz;
assign BUFF_out[3]= DEC_out[3]?D[3]:1'bz;
/////all output port connection/////
assign Y= BUFF_out[0]&~DEC_out[1]&~DEC_out[2]&~DEC_out[3];
assign Y= BUFF_out[1]&~DEC_out[0]&~DEC_out[2]&~DEC_out[3];
assign Y= BUFF_out[2]&~DEC_out[0]&~DEC_out[1]&~DEC_out[3];
assign Y= BUFF_out[3]&~DEC_out[0]&~DEC_out[1]&~DEC_out[2];
endmodule
//////////test bench////////
module tb_mux41();
reg [3:0]d;
reg [1:0]sel;
wire y;
mux41_d_t m1(d,sel,y);
initial
begin
d=1010;
sel=00; #100
sel=01; #100
sel=10; #100
sel=11; 
end 
endmodule
