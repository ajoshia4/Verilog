// Code your testbench here
// or browse Examples
module day8_tb();

  // Write your Testbench here...
  localparam BIN_W       = 4;
  localparam ONE_HOT_W   = 16;
  
     logic [BIN_W-1:0]     bin_i;
    logic [ONE_HOT_W-1:0] one_hot_o;
  
  day8  #(BIN_W,ONE_HOT_W) U1(.*);
  
  initial begin
    for (int i=0; i < 32; i++) begin
    bin_i = i;
    #5;
    $display("Binary Value=%b :: one hot output=%b", bin_i, one_hot_o);
    end
  end
endmodule
