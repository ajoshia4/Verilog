// Simple shift register
module day6(
  input     wire        clk,
  input     wire        reset,
  input     wire        x_i,      // Serial input

  output    wire[3:0]   sr_o
);
  logic [3:0] sr_o_reg;

  // Write your logic here...
  always @(posedge clk or posedge reset) begin
    if (reset) sr_o_reg <= 0;
    else sr_o_reg <= {sr_o_reg[2:0], x_i};
  end
  
  assign sr_o = sr_o_reg;
endmodule
