////half_adder////
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry;
xor (sum,a,b);
and (carry,a,b);
endmodule 
////test bench////
module tb_half_adder();
reg a,b;
wire sum,carry;
half_adder h1 (a,b,sum,carry);
initial
begin
a=0; b=0; #100;
a=0; b=1; #100;
a=1; b=0; #100;
a=1; b=1;
end 
endmodule 