// Code your testbench here
// or browse Examples
module div3_detector_tb;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg bit_in;
    wire out;

    // Instantiate the DUT (Device Under Test)
    divisible_by_3 dut (
        .clk(clk),
        .rst_n(rst_n),
        .bit_in(bit_in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period
    end

    // Variables for tracking the number and cycle
    integer cycle = 0;
    reg [31:0] current_number = 0;  // To store the cumulative binary number
    reg [31:0] decimal_value;       // Decimal equivalent
    reg expected_out;               // Expected output

  task generate_test();
    current_number = 0;
    decimal_value = 0;
    expected_out = (decimal_value % 3 == 0) ? 1 : 0;  
    for(int i=0;i<20;i++) begin
    cycle=cycle+1;
    bit_in=$random(); #10;
    current_number = (current_number<<1) | bit_in;
    decimal_value = current_number;
  expected_out = (decimal_value % 3 == 0) ? 1 : 0;  
      $display("%5d | %9b | %10b | %7d | %15b | %13b | %s", 
                 cycle, bit_in, current_number, decimal_value, expected_out, out, 
                 (out == expected_out) ? "Pass" : "Fail");
    end
  endtask
    
    // Test procedure
    initial begin
        // Initialize signals
        rst_n = 0;
        bit_in = 0;
        
        // Display table header
        $display("Cycle | Input Bit | Current Binary | Decimal | Expected Output | Actual Output | Pass/Fail");
        $display("------|-----------|----------------|---------|-----------------|---------------|----------");
        
        // Reset (Cycle 0)
        #10;
        rst_n = 1;
      
      generate_test();

        
        // Finish simulation
        #20;
        $finish;
    end

endmodule
