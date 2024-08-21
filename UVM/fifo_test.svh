class fifo_test extends uvm_test;

    `uvm_component_utils(fifo_test)
    function new(string name = "fifo_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction 
endclass