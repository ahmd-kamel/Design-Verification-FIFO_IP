class fifo_agent extends uvm_agent;

    `uvm_component_utils(fifo_agent)

    function (string name = "fifo_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass 