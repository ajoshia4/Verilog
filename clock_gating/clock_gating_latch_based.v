// Code your design here
module clock_gating (clk,rst_n,d,en,q);
input clk,rst_n,en,d;
output reg q;
wire gated_clk;
  reg latch_out;

always@(posedge gated_clk) begin
if(!rst_n) q<=0;
else    q<=d;
end

always@(*) begin
if(!clk)    latch_out = en;  
end

assign gated_clk = clk & latch_out;

endmodule
