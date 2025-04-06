// Code your testbench here
// or browse Examples
module day7_tb ();

  logic clk, reset;
  logic [3:0] lfsr_o;
  // Write your Testbench here...
  day7 U1(.*);
  
  initial begin
    clk=0;
    reset=1;
    @(posedge clk);
    reset=0;
    $monitor("lfsr_o =%b", lfsr_o);
    #100;
    $finish;
  end
  
  always #5 clk = ~clk;
endmodule
