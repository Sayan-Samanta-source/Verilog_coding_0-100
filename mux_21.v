module mux_21(a,b,sel,y);
input wire a;
input wire b;  
input wire sel;
output wire y;      
assign y = (sel) ? b : a;
endmodule
///////////////tb/////////////////
module tb_mux_21();
reg a, b, sel;
wire y;
mux_21 m1 (a,b,sel,y);
initial 
begin
a = 0; b = 0; sel = 0; #100;
a = 0; b = 1; sel = 0; #100;
a = 1; b = 0; sel = 0; #100;
a = 1; b = 1; sel = 0; #100;
a = 0; b = 0; sel = 1; #100;
a = 0; b = 1; sel = 1; #100;
a = 1; b = 0; sel = 1; #100;
a = 1; b = 1; sel = 1; 
end
endmodule
