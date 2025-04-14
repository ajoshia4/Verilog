module n_flop_synchronizer #(
                                parameter N = 3)
                            (clk, rst_n, async_in, sync_out);
  
  input wire clk,rst_n;
  input wire async_in;
  output wire sync_out;

  reg [N-1:0] sync_flop_chain;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin 
      sync_flop_chain <= {N{1'b0}};
    end
    else begin
        if (N > 1) begin
        sync_flop_chain <= {sync_flop_chain[N-2:0], async_in} ;
        end
    end
  end
  
  assign sync_out = sync_flop_chain[N-1];
  
endmodule
