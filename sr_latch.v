module sr_latch_gate(S,R,Q,Q_bar);
input S, R;
output Q, Q_bar;
wire nand1_out, nand2_out;
nand (nand1_out, S, Q_bar);
nand (nand2_out, R, Q);
assign Q = nand1_out;
assign Q_bar = nand2_out;
endmodule
/////////tb/////////
module tb_sr_latch_gate();
reg S, R;
wire Q, Q_bar;
sr_latch_gate s1 (S,R,Q,Q_bar);
    initial begin
S = 0; R = 0; #100;
S = 1; R = 0; #100;
S = 0; R = 1; #100;
S = 1; R = 1;
end
endmodule

