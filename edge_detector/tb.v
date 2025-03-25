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
  reset =1;
  a_i=0;
  #20;
  reset=0;
  #5;
  for(int i=0;i<10;i++) begin
    @(posedge clk);
    a_i= $random;
  end
	#100;
  $finish();
end
  
  always #5 clk=~clk;

   // Monitor output
  initial begin
    $dumpfile("waveform.vcd");  // Generates waveform file
    $dumpvars(0, day3_tb);  // Dumps all signals in the testbench
  end

  
endmodule
