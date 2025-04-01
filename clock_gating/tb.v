// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb;
  
  reg clk, rst_n, en,d;
  wire q;
  
  initial begin
    clk=0;
    rst_n=0;
    d=0;
  	en=1;
    #20;
    rst_n=1;
    en =1;
    d=1;
    #7;
    d=0;
    en = 0;
    #10;
    en=1;
    #10;
    en=0;
    #100;
    $finish();
  end
  
  clock_gating U1 (.clk(clk), .rst_n(rst_n), .d(d), .en(en), .q(q));
  
 	always #5 clk=~clk;
   // gated_clk = clock_gating.gated_clk;
  initial begin
    $dumpfile("dump.vcd"); // Create VCD file
    $dumpvars(0, tb);   // Dump all variables in testbench
  end
  
endmodule
