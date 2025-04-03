
	module edge_detector (
	  input     wire    clk,
	  input     wire    rst_n,
	
	  input     wire    inp_data,
	
	  output    wire    leading_edge_det,
	  output    wire    trailing_edge_det
	);
	  reg q;
	
	  always @(posedge clk) begin
	    if(!rst_n) q<=0;
	    else q<=inp_data;
	  end
	  
	  assign leading_edge_det = inp_data & ~q;
	  assign trailing_edge_det = ~inp_data & q;
	  
endmodule
