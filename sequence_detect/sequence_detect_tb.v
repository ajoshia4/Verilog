// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module sequence_detect_tb;
  logic clk, rst, in,out;
  reg [1:0] cur_state, nex_state;
    sequence_detect dut (.clk(clk),.rst(rst),.in(in),.out(out));

//These two are for debug purpose. To see the state transitions
  assign cur_state = dut.current_state;
  assign nex_state = dut.next_state;

//Clock generation logic
  always #5 clk=~clk;


// Task to apply test cases
  // task apply_test(input logic [15:0] test_data);
  //   integer i;
  //   for (i = 15; i >= 0; i--) begin
  //     in = test_data[i];
  //     #1;  // Small delay to allow state and output to settle
  //     $display("Time=%0t | current_state=%b | next_state=%b | in=%b | out=%b", $time, cur_state, nex_state, in, out);
  //     #9;  // Wait for the rest of the clock cycle
  //   end
  // endtask


  initial begin
    clk=0;
    rst=1;
    in=0;
    #15 rst=0;
     for (int i=0;i<100;i++) begin
          in =$random();
          #1;  // Small delay to allow state and output to settle
          $display("Time=%0t | current_state=%b | next_state=%b | in=%b | out=%b", $time, cur_state, nex_state, in, out);
          #9;  // Wait for the rest of the clock cycle
  end
  
  //  apply_test(16'b0001011000000000); // Expected: 1 detection

    #1000;
    $finish();
  end
  

  
//initial begin
 
//end

// initial begin
// in=1; #10;
// in=0; #10;
// in=1; #10;
// in=1; #10;
// in=0; #10;
// in=1; #10;
// in=1; #10;
// in=0; #10;
// in=1; #10;
// in=0; #10;
// end
// initial begin
// in=1; #10;
// in=0; #10;
// in=1; #10;
// in=0; #10;
// in=1; #10;
// in=1; #10;
// in=1; #10;
// in=0; #10;
// in=1; #10;
// in=0; #10;
// end
// initial begin
//   $monitor("In:%d", in);
//   $monitor("Out:%d", out);
// end
  
   initial begin
        $dumpfile("waveform.vcd"); // Specify the output waveform file
        $dumpvars(0, sequence_detect_tb);    // Dump all variables in testbench
    end

endmodule
