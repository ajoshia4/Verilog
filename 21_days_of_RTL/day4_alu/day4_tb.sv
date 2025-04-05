// Code your testbench here
// or browse Examples
// Simple ALU TB

module day4_tb ();
  logic [7:0]   a_i;
  logic [7:0]   b_i;
  logic [2:0]   op_i;

  logic [7:0]   alu_o;
  // Write your Testbench here...
  day4 U1 (.a_i,.b_i,.op_i,.alu_o);
  
  task generate_test(bit [7:0] a, bit [7:0] b ,bit [7:0]op);
    a_i [7:0] = a;
    b_i [7:0]  = b;
    op_i [2:0] = op;
    #1; // wait a delta to update alu_o
  $display("op = %0d, a = %0d, b = %0d, result = %0d", op, a, b, alu_o);
  endtask
  
  
  initial begin
    for (int i=0; i<7; i++) begin
      generate_test($urandom_range(0,8'hFF), $urandom_range(0,8'hFF), 3'(i))
    end
   // generate_test(8'b00000001, 8'b00000001, 3'b000);
   //generate_test(8'b00000001, 8'b00000001, 3'b001);
   //generate_test(8'b00000001, 8'b00000001, 3'b010);
    //generate_test(8'b00000001, 8'b00000001, 3'b011);
      //generate_test(8'b00000001, 8'b00000001, 3'b100);
	//generate_test(8'b00000001, 8'b00000001, 3'b101);
    ///  generate_test(8'b00000001, 8'b00000001, 3'b110);
     //generate_test(8'b00000001, 8'b00000001, 3'b101);
   //generate_test(8'b00000001, 8'b00000001, 3'b111);
    #10;
    $finish;
  end
  
  //initial begin
  //  $monitor("Operation : %d, a_i = %d, b =%d, alu_o=%d",op_i, a_i, b_i, alu_o);
  //end
endmodule
