Day 5
Design and verify an 8-bit odd counter

Interface Definition
Counter should reset to a value of 8'h1
Counter should increment by 2 on every cycle
The module should have the following interface:
input     wire        clk,
input     wire        reset,

output    logic[7:0]  cnt_o
Coding Exercise
You're expected to code both the RTL and testbench for the problem. Your testbench should include the stimulus and checkers.
