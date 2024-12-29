-----------------------------------------------------------
// Including interface and testcase files
`include "mem_interface.sv"
`include "mem_base_test.sv"
`include "mem_wr_rd_test.sv"
//---------------------------------------------------------------

module tbench_top;

  //---------------------------------------
  // Clock and reset signal declaration
  //---------------------------------------
  bit clk;
  bit reset;
  
  //---------------------------------------
  // Clock generation
  //---------------------------------------
  always #5 clk = ~clk;
  
  //---------------------------------------
  // Reset generation
  //---------------------------------------
  initial begin
    reset = 1;
    #10 reset = 0;
  end
  
  //---------------------------------------
  // Interface instance
  //---------------------------------------
  mem_if intf(clk, reset);
  
  //---------------------------------------
  // DUT instance
  //---------------------------------------
 axi4_lite_top DUT (
    .ACLK(intf.clk),
    .ARESETN(~intf.reset),
    .address(intf.addr),
    .write_s(intf.wr_en),
    .read_s(intf.rd_en),
    .W_data(intf.wdata),
    .R_data(intf.rdata)
   );
  
  //---------------------------------------
  // Passing the interface handle to lower hierarchy using set method 
  // and enabling the wave dump
  //---------------------------------------
  initial begin 
    uvm_config_db#(virtual mem_if)::set(uvm_root::get(), "*", "vif", intf);
    
    // Run the test
    run_test("mem_model_base_test");
  end
  
  initial begin
        $dumpfile("tbench_top.vcd");
        $dumpvars(0, tbench_top);
    end

endmodule
