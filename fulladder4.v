module fulladder4 (A,B,CIN,S,CO);
    output[3:0]S;
    output CO;
input [3:0]A,B;
input CIN;
assign{CO,S}=A+B+CIN;
endmodule
/////////// 4bit full adder //////////

module tb_FA4();
      reg [3:0]a,b;
      reg cin;
   wire [3:0]s;
wire co;

fulladder4 f1(a,b,cin,s,co);
initial
begin 
a=4'b0000; b=4'b0001; cin=1'b0;
#100
a=4'b0011; b=4'b0011; cin=1'b0;
#100
a=4'b1111; b=4'b1011; cin=1'b0;
#100
a=4'b0011; b=4'b0001; cin=1'b1;
end
endmodule 