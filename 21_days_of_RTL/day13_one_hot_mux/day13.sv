// Various ways to implement a mux

module day13 (
  input     wire[3:0] a_i,
  input     wire[3:0] sel_i,

  // Output using ternary operator
  output    wire     y_ter_o,
  // Output using case
  output    logic     y_case_o,
  // Ouput using if-else
  output    logic     y_ifelse_o,
  // Output using for loop
  output    logic     y_loop_o,
  // Output using and-or tree
  output    logic     y_aor_o
);

  wire [3:0] y;
  // Write your logic here...
//Ternary Operator
  assign y_ter_o = sel_i[0] ? a_i[0] : sel_i[1] ? a_i[1] : sel_i[2] ? a_i[2] :  a_i[3]  ;

  // Case
  always@(*) begin
  case(sel_i)
    4'b0001 : y_case_o = a_i[0];
    4'b0010 : y_case_o = a_i[1];
    4'b0100 : y_case_o = a_i[2];
    4'b1000 : y_case_o = a_i[3];
    default : y_case_o = 1'b0;
  endcase
  end
  
  //if-else
  always@(*) begin
  if(sel_i[0])  y_ifelse_o = a_i[0];
  else if(sel_i[1])  y_ifelse_o = a_i[1];
  else if(sel_i[2])  y_ifelse_o = a_i[2];
  else   y_ifelse_o = a_i[3];
  end
  
  //for

  always@(*) begin
    for (int i=0; i<4;i=i+1) begin
    if(sel_i[i])  y_loop_o = a_i[i];
      else  y_loop_o = 0;
  end
  end
  
  //and-or tree
  
  assign y[0] = a_i[0] & sel_i[0];
  assign y[1] = a_i[1] & sel_i[1];
  assign y[2] = a_i[2] & sel_i[2];
  assign y[3] = a_i[3] & sel_i[3];
  
  assign y_aor_o = y[0] | y[1] | y[2] | y[3];
  
endmodule
