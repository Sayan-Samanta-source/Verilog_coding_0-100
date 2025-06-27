///// full subtractor////
module full_subtractor (a,b,cin,sub,borrow);
input wire a;
input wire b;
input wire cin;
output wire sub;
output wire borrow;
assign sub = a ^ b ^ cin;
assign borrow = (~a & b) | ((~(a ^ b)) & cin);
endmodule
////test bench////
module tb_full_subtractor();
reg a, b, cin;
wire sub, borrow;
full_subtractor s1 (a,b,cin,sub,borrow);
initial 
begin
a = 0; b = 0; cin = 0; #100;
a = 0; b = 0; cin = 1; #100;
a = 0; b = 1; cin = 0; #100;
a = 0; b = 1; cin = 1; #100;
a = 1; b = 0; cin = 0; #100;
a = 1; b = 0; cin = 1; #100;
a = 1; b = 1; cin = 0; #100;
a = 1; b = 1; cin = 1; 
end
endmodule
