// Code your design here
module asynchronous_reset(clk,rst,d,q);
  input clk,rst,d;
  output reg q;
  
  always@(posedge clk or posedge rst) begin
    if(rst) q<=1'b0;
    else q<=d;
  end
  
endmodule
