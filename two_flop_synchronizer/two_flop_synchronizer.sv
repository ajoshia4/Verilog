module two_flop_synchronizer #(
  parameter N = 2) (clk, rst_n, async_in, sync_out);
  
  input wire clk,rst_n;
  input wire async_in;
  output wire sync_out;
  reg ff1_q, ff2_q;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin 
      ff1_q<=0; 
      ff2_q<=0;
    end
    else begin
      ff1_q <= async_in;
      ff2_q <= ff1_q;
    end
  end
  
  assign sync_out = ff2_q;
  
endmodule
