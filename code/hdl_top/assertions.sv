`ifndef MASTER_ASSERTIONS_INCLUDED_
`define MASTER_ASSERTIONS_INCLUDED_

import apb_global_pkg::*;
interface master_assertions(input pclk, 
                            input preset_n,
                            input [NO_OF_SLAVES-1:0]psel,
                            input penable,
                            input [ADDRESS_WIDTH-1:0]paddr,
                            input pwrite,
                            input [(DATA_WIDTH/8)-1:0]pstrb,
                            input [DATA_WIDTH-1:0]pwdata);

import uvm_pkg::*;
`include "uvm_macros.svh";
initial begin
  `uvm_info("MASTER ASSERTIONS","MASTER ASSERTIONS",UVM_LOW);
end

property stable_check;
   @(posedge pclk) disable iff (preset_n)
   (psel==1) |=> ($stable(pwrite) && $stable(paddr) && $stable(pwdata));
endproperty:stable_check
//stable_check:assert property(stable_check);

property valid_check;
  @(posedge pclk) disable iff (preset_n)
    $rose(psel && paddr && pwrite && penable && pwdata && pready && pslverr && prdata && pstrb);
endproperty :valid_check
//valid_check: assert property (valid_check);


property penable_deassertion;
  @(posedge pclk) disable iff (preset_n)
  (pready==1) |-> ($fell(penable));
endproperty :penable_deassertion
//penable_deassertion: assert property (penable_deassertion);


property preset_n_deassertion;
  @(posedge pclk)  ($fell(preset_n));
endproperty :preset_n_deassertion
//preset_n_deassertion: assert property (preset_n_deassertion);
endinterface:master_assertions

`endif
