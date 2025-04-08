// Simple TB

module day13_tb ();

  logic [3:0] a_i;
  logic [3:0] sel_i;

  // Output using ternary operator
logic y_ter_o;
  // Output using case
logic y_case_o;
  // Ouput using if-else
logic     y_ifelse_o;
  // Output using for loop
logic     y_loop_o;
  // Output using and-or tree
logic     y_aor_o;
  // Write your Testbench here...

  day13 U1(.*);
  initial begin
    for(int i=0;i<16;i++) begin
      a_i = $random;
      #1;
    end
  end
  initial begin
    for(int j=0;j<4;j++) begin
      sel_i = 1 << j;
      #1;
    end
  end
  initial begin
      #100;
    $finish();
  end
  initial begin
    $monitor("a_i=%b, sel_i=%b, y_ter_o=%b, y_case_o=%b, y_ifelse_o=%b, y_loop_o=%b, y_aor_o=%b ", a_i, sel_i, y_ter_o, y_case_o, y_ifelse_o,y_loop_o, y_aor_o);
    end

  
  
endmodule
