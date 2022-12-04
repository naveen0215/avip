`ifndef APB_SLAVE_VD_VWS_INCLUDED_
`define APB_SLAVE_VD_VWS_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_slave_vd_vws
//  Extends the apb_slave_base_seq and randomises the req item
//--------------------------------------------------------------------------------------------
class apb_slave_vd_vws_seq extends apb_slave_base_seq;
  `uvm_object_utils(apb_slave_vd_vws_seq)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_slave_vd_vws_seq");
  extern task body();
endclass : apb_slave_vd_vws_seq

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - apb_slave_vd_vws
//--------------------------------------------------------------------------------------------
function apb_slave_vd_vws_seq::new(string name = "apb_slave_vd_vws_seq");
  super.new(name);
endfunction : new

//--------------------------------------------------------------------------------------------
// Task : Body
//  Creates the req of type slave transaction and randomises the req.
//--------------------------------------------------------------------------------------------
task apb_slave_vd_vws_seq::body();
  req = apb_slave_tx::type_id::create("req");
  start_item(req);
    if(!req.randomize()) begin
      `uvm_fatal(get_type_name(),"Randomisation failed");
    end
    req.print();
  finish_item(req);
endtask : body

`endif

