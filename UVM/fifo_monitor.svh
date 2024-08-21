class fifo_monitor extends uvm_monitor;

    `uvm_component_utils(fifo_monitor)

    function new(string name = "fifo_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass 