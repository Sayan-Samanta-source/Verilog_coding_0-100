module g_d_latch(D,En,Q);
input D;
input En;
output reg Q;
always @ (En or D)begin
if (En)
Q = D;
end
endmodule
//////tb////////
module tb_g_d_latch();
reg D, En;
wire Q;
g_d_latch g1 (D,En,Q);
initial begin
En=0; D=1; #100; 
En=0; D=0; #100; 
En=1; D=1; #100; 
En=1; D=0;
end
endmodule
