////full adder////
module full_adder (A,B,Cin,Sum,Cout);
input wire A;
input wire B;
input wire Cin;
output wire Sum;
output wire Cout;
assign Sum  = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule
////test bench////
module full_adder_tb;
reg A, B, Cin;
wire Sum, Cout;
full_adder c1 (A,B,Cin,Sum,Cout);
initial 
begin
A = 0; B = 0; Cin = 0; #100;
A = 0; B = 0; Cin = 1; #100;
A = 0; B = 1; Cin = 0; #100;
A = 0; B = 1; Cin = 1; #100;
A = 1; B = 0; Cin = 0; #100;
A = 1; B = 0; Cin = 1; #100;
A = 1; B = 1; Cin = 0; #100;
A = 1; B = 1; Cin = 1;
end
endmodule
