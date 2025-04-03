// Code your testbench here
// or browse Examples
	module tb;
	reg   clk;
	reg    rst_n;
	
	reg   inp_data;
	
	wire   leading_edge_det;
	wire   trailing_edge_det;
	
      edge_detector U1 (clk,rst_n,inp_data,leading_edge_det,trailing_edge_det);
	
	initial begin
	  clk=0;
	  rst_n =0;
	  inp_data=0;
	  #10;
	  rst_n=1;
	  for(int i=0;i<100;i++) begin
	    inp_data= $random;
	    #10;
	  end
		#100;
	  $finish();
	end
	  
	  always #5 clk=~clk;
	  
	initial begin
	    $dumpfile("dump.vcd"); // Create VCD file
	    $dumpvars(0, tb);   // Dump all variables in testbench
	  end
	  
	endmodule
