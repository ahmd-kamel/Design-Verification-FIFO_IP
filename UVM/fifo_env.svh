class fifo_env extends uvm_env;
    `uvm_component_utils(fifo_env)

    function (string name = "fifo_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass