module mux_41(I0,I1,I2,I3,S0,S1,Y);
     input I0,I1,I2,I3;
     input S0,S1;
     output Y;
assign Y=(I0&~S1&~S0);
assign Y=(I1&~S1&S0);
assign Y=(I2&S1&~S0);
assign Y=(I3&S1&S0);

endmodule 
/////////4*1 mux////////
module tb_mux();

reg i0,i1,i2,i3;
reg s0,s1;
wire y;
mux_41 f1(i0,i1,i2,i3,s0,s1,y);
initial
begin
i0=1; i1=1; i2=1; i3=1;
s0=0; s1=0;
#100
s0=0; s1=1;
#100
s0=1; s1=0;
#100
s0=1; s1=1;
end
endmodule

