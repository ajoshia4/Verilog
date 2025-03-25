// An edge detector

module day3 (
  input     wire    clk,
  input     wire    reset,

  input     wire    a_i,

  output    wire    rising_edge_o,
  output    wire    falling_edge_o
);
  reg q;

  // Write your logic here...
  always @(posedge clk) begin
    if(reset) q<=0;
    else q<=a_i;
  end
  
  assign rising_edge_o = a_i & ~q;
  assign falling_edge_o = ~a_i & q;
  
endmodule
