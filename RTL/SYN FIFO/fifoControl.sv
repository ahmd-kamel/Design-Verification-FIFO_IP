module SynchFifoControl
#(parameter ADD_WIDTH = 4)
(
    input  logic clk, reset_n,
    input  logic wr, rd,
    output logic full, empty,
    output logic [ADD_WIDTH - 1 : 0] w_addr,
    output logic [ADD_WIDTH - 1 : 0] r_addr
);

logic [ADD_WIDTH - 1 : 0] wr_ptr, wr_ptr_next;
logic [ADD_WIDTH - 1 : 0] rd_ptr, rd_ptr_next;

logic full_next;
logic empty_next;

always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        full <= 1'b0;
        empty <= 1'b1;
    end
    else begin
        wr_ptr <= wr_ptr_next;
        rd_ptr <= rd_ptr_next;
        full <= full_next;
        empty <= empty_next;
    end
end

always_comb begin
    wr_ptr_next = wr_ptr; 
    rd_ptr_next = rd_ptr; 
    full_next = full;
    empty_next = empty;

    case ({wr, rd})
        2'b01: //read
        begin
            if(~empty) begin
                rd_ptr_next = rd_ptr + 1;
                full_next = 1'b0;
                if(rd_ptr_next == rd_ptr)
                    empty_next = 1'b1;
            end
        end

        2'b10: //write
        begin
            if(~full) begin
                wr_ptr_next = wr_ptr + 1;
                empty_next = 1'b0;
                if(wr_ptr_next == rd_ptr)
                    full_next = 1'b1;
            end
        end

        2'b11: //write amd write
        begin
            if (empty) begin
                wr_ptr_next = wr_ptr;
                rd_ptr_next = rd_ptr; 
            end
            else begin                
                wr_ptr_next = wr_ptr + 1;
                rd_ptr_next = rd_ptr + 1;
            end

        end
    endcase
end

endmodule