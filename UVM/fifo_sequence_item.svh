class fifo_sequence_item extends uvm_sequence_item;

    `uvm_object_utils(fifo_sequence_item)

    function new(string name = "fifo_sequence_item");
        super.new(name);
    endfunction
endclass