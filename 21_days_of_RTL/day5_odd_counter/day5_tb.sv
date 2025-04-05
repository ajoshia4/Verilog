// Simple TB

module day5_tb ();
logic clk, reset;
logic [7:0] cnt_o;
  // Write your Testbench here...
  day5 U1(.*);
  
  initial begin
    clk=0;
    reset=1;
    #20;
    reset=0;

    #500;
    $finish;
  end
  
  always #5 clk = ~clk;
  
  initial begin
   $monitor("cnt_o = %d", cnt_o);
  end
 
endmodule
