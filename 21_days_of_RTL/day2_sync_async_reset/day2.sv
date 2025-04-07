// Code your design here
module day2 (
  input     logic      clk,
  input     logic      reset,

  input     logic      d_i,

  output    logic      q_norst_o,
  output    logic      q_syncrst_o,
  output    logic      q_asyncrst_o
);

  // No reset
  always_ff @(posedge clk) begin
    q_norst_o <= d_i;
  end

  // Sync reset
  always_ff @(posedge clk) begin
    if (reset)
      q_syncrst_o <= 1'b0;
    else
      q_syncrst_o <= d_i;
  end

  // Async reset
  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      q_asyncrst_o <= 1'b0;
    else
      q_asyncrst_o <= d_i;
  end

endmodule
