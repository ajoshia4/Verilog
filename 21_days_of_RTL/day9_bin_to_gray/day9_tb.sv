module day9_tb ();

  localparam VEC_W = 4;
  // Write your Testbench here...
    logic [VEC_W-1:0] bin_i;
    logic [VEC_W-1:0] gray_o;
  
  day9 #(4) U1(.*);
  
  initial begin
    for (int i=0; i<16; i++) begin
      bin_i=i;
      #1;
      $display("bin_i=%b, gray_o=%b", bin_i,gray_o);
    end
  end
endmodule
