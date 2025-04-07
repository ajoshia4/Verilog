// A simple TB for mux

module day1_tb ();
  logic [7:0]    a_i;
  logic [7:0]    b_i;
  logic         sel_i;
  logic [7:0]    y_o;
  // Write your Testbench here...
  day1 U1(.*);
initial begin
  for (int i=0; i<32; i++) begin
    a_i = $random;
    b_i= $random;
    sel_i = $random & 1;
    #1;
    $display ("a_i = %d, b_i=%d, sel_i =%d, y_o = %d", a_i, b_i, sel_i, y_o);
  end
end
endmodule
