// Code your design here
// LFSR
module day7 (
  input     wire      clk,
  input     wire      reset,

  output    wire[3:0] lfsr_o
);

  wire xor_o;
  reg [3:0] lfsr_o_reg;
  assign xor_o = lfsr_o[1] ^ lfsr_o[3];
  
  // Write your logic here...
  always@(posedge clk or posedge reset) begin
    if(reset) lfsr_o_reg <=1;
    else lfsr_o_reg <= {lfsr_o_reg[2:0], xor_o};
  end
  
assign lfsr_o = lfsr_o_reg;
endmodule
