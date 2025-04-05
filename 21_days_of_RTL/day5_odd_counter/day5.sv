// Odd counter

module day5 (
  input     wire        clk,
  input     wire        reset,

  output    logic[7:0]  cnt_o
);

  // Write your logic here...
  always @ (posedge clk or posedge reset) begin
    if (reset) cnt_o <= 1;
    else cnt_o <= cnt_o + 2 ;
  end
endmodule
