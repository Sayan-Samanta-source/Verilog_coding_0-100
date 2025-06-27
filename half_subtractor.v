module half_subtractor (a,b,sub,borrow);
input wire a;
input wire b;
output wire sub;
output wire borrow;
assign sub = a ^ b; 
assign borrow = (~a) & b; 
endmodule
////test bench////
module tb_half_subtractor();
reg a, b;
wire sub, borrow;
half_subtractor h1 (a,b,sub,borrow);
initial begin
a = 0; b = 0; #100;
a = 0; b = 1; #100;
a = 1; b = 0; #100;
a = 1; b = 1; 
end
endmodule
