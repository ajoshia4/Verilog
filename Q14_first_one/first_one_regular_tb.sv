// Code your testbench here
// or browse Examples
module tb;
  
  logic [3:0] inp_vec;
  logic [3:0] op_vec;
  
  first_one U1(.*);
  
  initial begin
    for (int i=0; i<15; i++) begin
    inp_vec = i;
       #5;
      $display("inpvec=%b, op_vec=%b", inp_vec, op_vec);
    end
    $50;
    $finish();
  end
    
    //initial begin
      //$monitor("inpvec=%d, op_vec=%d", inp_vec, op_vec);
    //end
    endmodule   
