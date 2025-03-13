// Code your testbench here
// or browse Examples
module digital_clock_tb;
  wire [5:0] seconds, minutes;
  wire [4:0] hours;
reg clk;
reg rst;

initial begin
    clk=0;
    rst=1;
    #10;
    rst=0;
    #20;
    rst=1;
    #10;
    rst=0;
end

initial begin
  $monitor("Hours:Minutes:Seconds :: %02d:%02d:%02d",hours,minutes,seconds);
end

always #5 clk=~clk;

digital_clock u1(clk,rst,seconds,minutes,hours);
endmodule
