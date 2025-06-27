module t_d_ff ( T,clk,rst,Q);
input T, clk, rst;
output reg Q;
wire D;
assign D = T ^ Q;
always @(posedge clk or posedge rst) begin
if (rst)
Q <= 0;
else
Q <= D;
end
endmodule
////////////tb////////////
module tb_t_d_ff();
reg T, clk, rst;
wire Q;
t_d_ff f3 (T,clk,rst,Q);
always #10 clk = ~clk;
initial begin
        rst = 1; T = 0; #10;
        rst = 0;
        T = 0; #10;  // No toggle
        T = 1; #10;  // Toggle
        T = 1; #10;  // Toggle
    end
endmodule
