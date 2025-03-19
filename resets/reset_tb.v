// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module tb;
  reg clk,rst,d;
  wire q;
  
  synchronous_reset U1 (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );
  
    always #5 clk=~clk;
  
  initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        d = 0;

        // Apply reset
        #10 rst = 0; // Deassert reset
        #10 d = 1;   // Apply input
       #10 rst = 1; // Assert reset again
        #10 d = 0;
        #10 d = 1;
        #10 rst = 0; // Deassert reset
        #10 d = 1;
        #20;

        // Finish simulation
    $finish();
    end
 

  
  initial begin
        $dumpfile("waveform.vcd"); // Specify the output waveform file
    $dumpvars(0, tb);    // Dump all variables in testbench
    end
  
endmodule
