class fifo_sequence extends uvm_sequence;

    `uvm_object_utils(fifo_sequence)

    function new(string name = "fifo_sequence");
        super.new(name);
    endfunction
endclass