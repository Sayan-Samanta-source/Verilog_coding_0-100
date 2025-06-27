// twisted_ring_counter//
module twisted_ring_counter (clk,reset,q);
input wire clk,reset;
output reg [3:0] q;
always @(posedge clk or posedge reset) begin
if (reset)
q <= 4'b0000;
else begin
q <= {~q[0], q[3:1]};
end
end
endmodule
// test bench//
module tb_twisted_ring_counter();
reg clk,reset;
wire [3:0] q;
twisted_ring_counter t1 (clk,reset,q);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
reset = 1; #10;
reset = 0;  
end
endmodule
