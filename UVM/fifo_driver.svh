class fifo_driver extends uvm_driver #(fifo_sequence_item);

    `uvm_component_utils(fifo_driver)
    function (string name = "fifo_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction 
endclass