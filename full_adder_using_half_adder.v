////half_adder////
module half_adder1(A,B,S,C);
input A,B;
output S,C;
xor (S,A,B);
and (C,A,B);
endmodule
////full_adder////
module full_adder2(A,B,Cin,S,Co);
input A,B,Cin;
output S,Co;
wire W1,W2,W3;
half_adder1 h1(A,B,W1,W2);
half_adder1 h2(W1,Cin,W3,s);
    or (W2,W3,Co);
endmodule
/////test bench////
module tb_FA();
reg a,b,c_in;
wire s,c_out;
full_adder2 f1(a,b,c_in,s,c_out);
initial
begin
a=0; b=0; c_in=0; #100;
a=0; b=0; c_in=1; #100;
a=0; b=1; c_in=0; #100;
a=0; b=1; c_in=1; #100;
a=1; b=0; c_in=0; #100;
a=1; b=0; c_in=1; #100;
a=1; b=1; c_in=0; #100;
a=1; b=1; c_in=1;
end
endmodule
