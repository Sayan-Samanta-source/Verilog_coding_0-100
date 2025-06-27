module dual_port_ram_16x8 (
    input wire clk,
    input wire we_a,            
    input wire [3:0] addr_a,       
    input wire [7:0] data_in_a,     
    output reg [7:0] data_out_a,    

    input wire we_b,             
    input wire [3:0] addr_b,       
    input wire [7:0] data_in_b,     
    output reg [7:0] data_out_b    
);

    reg [7:0] mem [15:0]; 

    always @(posedge clk) begin
  
        if (we_a)
            mem[addr_a] <= data_in_a;
        data_out_a <= mem[addr_a];

        if (we_b)
            mem[addr_b] <= data_in_b;
        data_out_b <= mem[addr_b];
    end

endmodule
/////test bench////
module tb_dual_port_ram_16x8;
    reg clk;
    reg we_a, we_b;
    reg [3:0] addr_a, addr_b;
    reg [7:0] data_in_a, data_in_b;
    wire [7:0] data_out_a, data_out_b;

    dual_port_ram_16x8 uut (
        .clk(clk),
        .we_a(we_a),
        .addr_a(addr_a),
        .data_in_a(data_in_a),
        .data_out_a(data_out_a),
        .we_b(we_b),
        .addr_b(addr_b),
        .data_in_b(data_in_b),
        .data_out_b(data_out_b)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
     
        we_a = 0; we_b = 0;
        addr_a = 0; addr_b = 0;
        data_in_a = 0; data_in_b = 0;

        #10;
        we_a = 1; we_b = 1;
        addr_a = 4'h1; data_in_a = 8'hAA;
        addr_b = 4'h2; data_in_b = 8'h55;

        #10;
        we_a = 0; we_b = 0;

        addr_a = 4'h1;
        addr_b = 4'h2;

        #10;

        we_a = 1; addr_a = 4'h3; data_in_a = 8'hF0;
        #10;
        we_a = 0;
        addr_b = 4'h3;
  
    end
endmodule
