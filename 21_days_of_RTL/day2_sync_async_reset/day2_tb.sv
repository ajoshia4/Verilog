// Code your testbench here
// or browse Examples
// DFF TB

module day2_tb ();
   logic      clk;
  logic      reset;

   logic      d_i;

  logic      q_norst_o;
  logic      q_syncrst_o;
   logic      q_asyncrst_o;
  
  day2 U1 (.*);
  
  initial begin
    clk=0;
    reset=1;
    #20;
    reset=0;
    for (int i=0; i< 16;i++) begin
      d_i = $random & 1;
      reset = $random & 1;
      #10;
      $display("d_i=%b, q_norst_o=%b, q_syncrst_o = %b, q_asyncrst_o =%b", d_i, q_norst_o, q_syncrst_o, q_asyncrst_o); 
    end
  #100;
  $finish;
  end
  
  always #5 clk = ~clk;
  
  
  initial begin
    $dumpfile("dump.vcd"); // Create VCD file
    $dumpvars(0, day2_tb);   // Dump all variables in testbench
  end

  // Write your Testbench here...

endmodule
