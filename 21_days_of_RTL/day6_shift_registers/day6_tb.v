module day6_tb ();
logic      clk;
logic     reset;
logic x_i;    // Serial input
logic [3:0]   sr_o;
  // Write your Testbench here...
  day6 U1 (.*);
  
  initial begin
    clk=0;
    reset=1;
    x_i=0;
    #20;
    reset = 0;
    repeat(10) begin
      x_i = $random & 1; #10;
      $display ("x_i= %b :: sr_o = %b",x_i, sr_o);
    end
    #200;
    $finish();
  end
  
//  initial begin
  //  $monitor ("x_i= %b :: sr_o = %b",x_i, sr_o);
  //end
  always #5 clk = ~clk;
  
    initial begin
    $dumpfile("dump.vcd"); // Create VCD file
    $dumpvars(0, day6_tb);   // Dump all variables in testbench
  end
endmodule
