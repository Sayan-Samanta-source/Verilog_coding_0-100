module fulladder_1(A,B,CIN,S,COUT);
  input A,B,CIN;
output S,COUT;
assign S=A^B^CIN;
assign COUT=(A&B)|(B&CIN)|(A&CIN);
endmodule 
/////////1bit full adder/////
module tb_fa();
reg a,b,cin;
wire s,cout;
fulladder_1 f1(a,b,cin,s,cout);
initial
begin
a=0; b=0; cin=0;
#100
a=0; b=0; cin=1;
#100
a=1; b=0; cin=0;
#100
a=1; b=0; cin=1;
#100
a=1; b=1; cin=0;
#100
a=1; b=1; cin=1;
end 
endmodule
