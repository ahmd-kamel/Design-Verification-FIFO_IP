class fifo_subscriber extends uvm_subscriber;

    `uvm_component_utils(fifo_subscriber)

    function new(string name = "fifo_subscriber", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass