// Simple edge detector TB

module day3_tb ();
reg   clk;
reg    reset;

reg   a_i;

wire   rising_edge_o;
wire   falling_edge_o;
  // Write your Testbench here...
   // An edge detector

  day3 U1 (clk,reset,a_i,rising_edge_o,falling_edge_o);

  // Write your logic here...
initial begin
  clk=0;
  reset =0;
  a_i=0;
  #10;
  reset=1;
  for(int i=0;i<10;i++) begin
    a_i= $random;
    #10;
  end
	#100;
  $finish();
end
  
  always #5 clk=~clk;

   initial begin
    $dumpfile("dump.vcd"); // Create VCD file
    $dumpvars(0, day3_tb);   // Dump all variables in testbench
  end
  
endmodule
