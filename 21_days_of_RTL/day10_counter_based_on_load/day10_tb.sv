module day10_tb ();

logic         clk;
logic         reset;
logic        load_i;
  logic [3:0]     load_val_i;
  logic [3:0]     count_o;

  // Write your Testbench here...
  
  day10 U1(.*);
  
initial begin
  clk=0;
  reset=1;
  load_i = 0;
  #20;
  reset=0;
  #5;
  for (int i=0; i < 15;i++) begin
  load_i= $random & 1;
  load_val_i = i;
    #20; 
    load_i = 0;
    #100;
  end
  #500;
  $finish();
end
  initial begin 
      $monitor("load_i=%d :: load_val_i=%d :: count_o = %d", load_i, load_val_i, count_o);
  end
  always #5 clk=~clk;
endmodule
