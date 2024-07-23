module SyncFifoTop
#(parameter DATA_WIDTH = 8, ADD_WIDTH = 4)
(
    input  logic clk,
    input  logic reset_n,
    input  logic wr,
    input  logic rd,
    input  logic [DATA_WIDTH-1:0] w_data,
    output logic [DATA_WIDTH-1:0] r_data,
    output logic full,
    output logic empty
);

logic w_en;
logic [ADD_WIDTH-1:0] r_addr, w_addr;

RegFile #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADD_WIDTH(ADD_WIDTH)
) reg_file (
    .clk(clk),
    .w_data(w_data),
    .w_en(w_en),
    .w_addr(w_addr),
    .r_addr(r_addr),
    .r_data(r_data)
);

SynchFifoControl #(
    .ADD_WIDTH(ADD_WIDTH)
) fifo_ctrl(
    .clk(clk),
    .reset_n(reset_n),
    .wr(wr),
    .rd(rd),
    .w_addr(w_addr),
    .r_addr(r_addr),
    .full(full),
    .empty(empty)
);

assign w_en = wr & ~full;
    
endmodule