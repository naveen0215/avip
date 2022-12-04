
`ifndef APB_SLAVE_16B_READ_SEQ_INCLUDED_
`define APB_SLAVE_16B_READ_SEQ_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_slave_16b_read_seq
//  Extends the apb_slave_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_slave_16b_read_seq extends apb_slave_base_seq;
  `uvm_object_utils(apb_slave_16b_read_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name="apb_slave_16b_read_seq");
  extern task body();

endclass : apb_slave_16b_read_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_slave_vd_vws
//--------------------------------------------------------------------------------------------
function apb_slave_16b_read_seq::new(string name="apb_slave_16b_read_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : Body
//  Creates the req of type slave transaction and randomises the req.
//--------------------------------------------------------------------------------------------
task apb_slave_16b_read_seq::body();
  req=apb_slave_tx::type_id::create("req");
  start_item(req);
  if(!req.randomize())
  begin
    `uvm_error(get_type_name(),"randomization failed");
  end
  req.print();
  finish_item(req);
endtask : body

`endif

