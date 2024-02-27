module digital_clock_tb;
  wire [5:0] seconds, minutes;
  wire [3:0] hours;
reg clk;
reg rst;
reg seconds_count, minutes_count,hours_count;

initial begin
    clk=0;
    rst=1;
    #10;
    rst=0;
    #200;
    rst=1;
    #10;
    rst=0;
    // seconds_count=0;
    // minutes_count=0;
    // hours_count=0;
end

initial begin
$monitor("Hours:Minutes:Seconds :: %0d,%0d,%0d",hours,minutes,seconds);
end
// initial begin $dumpfile("dump.vcd");
// $dumpvars;
// #200;
// $finish();
// end

always #1 clk=~clk;

digital_clock u1(clk,rst,seconds,minutes,hours);
endmodule