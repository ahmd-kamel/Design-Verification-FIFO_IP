module RegFile 
#(parameter DATA_WIDTH = 8, ADD_WIDTH = 4)
(
    input  logic clk,
    input  logic w_en,
    input  logic [ADD_WIDTH - 1 : 0]  r_addr,
    input  logic [ADD_WIDTH - 1 : 0]  w_addr,
    input  logic [DATA_WIDTH - 1 : 0] w_data,
    output logic [DATA_WIDTH - 1 : 0] r_data
);

logic [DATA_WIDTH - 1 : 0] memory [0 : 2 ** ADD_WIDTH - 1];

// synchronous write
always_ff @(posedge clk) begin
    if (w_en) begin
        memory[w_addr] <= w_data;
    end
end

// asynchronous read
assign r_data = memory[r_addr];

endmodule