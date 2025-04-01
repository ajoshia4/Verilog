
module clock_gating (clk,rst_n,d,en,q);
input clk,rst_n,en,d;
output reg q;
wire gated_clk;
//  reg latch_out;

  
assign gated_clk = clk & en;
  
always@(posedge gated_clk) begin
if(!rst_n) q<=0;
else    q<=d;
end

endmodule
