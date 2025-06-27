module mux4to1(output y, input [3:0] d, input [1:0] sel);
  assign y = (sel == 2'b00) ? d[0] :
             (sel == 2'b01) ? d[1] :
             (sel == 2'b10) ? d[2] :
                              d[3];
endmodule
///////
module mux10to1(output y, input [9:0] d, input [3:0] sel);
wire m1, m2, m3;
mux4to1 MUX1(m1, d[3:0], sel[1:0]); 
mux4to1 MUX2(m2, d[7:4], sel[1:0]); 
wire [3:0] d_last = {2'b00, d[9:8]};
mux4to1 MUX3(m3, d_last, sel[1:0]);  
wire [3:0] final_mux_inputs = {1'b0, m3, m2, m1};  
mux4to1 FINAL(y, final_mux_inputs, sel[3:2]);
endmodule
//////tb/////////
module tb_mux10to1();
reg [9:0] d;
reg [3:0] sel;
wire y;
mux10to1 D1(y, d, sel);
initial begin
d = 10'b1010101010;
sel = 4'd0; #100;
sel = 4'd1; #100;
sel = 4'd2; #100;
sel = 4'd3; #100;
sel = 4'd4; #100;
sel = 4'd5; #100;
sel = 4'd6; #100;
sel = 4'd7; #100;
sel = 4'd8; #100;
sel = 4'd9; 
end
endmodule
