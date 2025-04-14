module tb;
  
  logic clk,rst_n, async_in, sync_out;
  
  n_flop_synchronizer U1(.*);
  
  always #5 clk=~clk;
  
  initial begin
    clk=0;
    rst_n=0;
    #10;
    rst_n=1;
    for(int i=0;i<10;i++) begin
    async_in=$random;
    $display("async_in=%b, sync_out=%b",async_in, sync_out );
    #5;
    end
    #100;
    $finish();
  end
  
  
     initial begin
    $dumpfile("dump.vcd"); // Create VCD file
       $dumpvars(0, tb);   // Dump all variables in testbench
  end
endmodule
