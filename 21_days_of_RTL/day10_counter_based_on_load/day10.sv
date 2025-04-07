// Counter with a load
module day10 (
  input     wire          clk,
  input     wire          reset,
  input     wire          load_i,
  input     wire[3:0]     load_val_i,

  output    wire[3:0]     count_o
);

  logic [3:0] count_o_reg;
  // Write your logic here...
  
  always @(posedge clk or posedge reset) begin
    if(reset) count_o_reg <= 0;
    else count_o_reg <= (load_i)? load_val_i: (count_o_reg == 4'b1111) ? load_val_i : count_o_reg + 1;
  end
  
  assign count_o = count_o_reg;
endmodule
  
