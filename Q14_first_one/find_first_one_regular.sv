// Code your design here
module first_one(inp_vec,op_vec);
  input [3:0] inp_vec;
  output  logic [3:0] op_vec;
  
 
  
  always@(*) begin
    if (inp_vec[0] == 1'b1) op_vec=4'b0001;
    else if(inp_vec[1] == 1'b1) op_vec=4'b0010;
    else if(inp_vec[2] == 1'b1) op_vec=4'b0100;
    else  op_vec=4'b1000;
  end
endmodule
