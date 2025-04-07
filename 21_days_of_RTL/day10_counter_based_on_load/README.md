Day 10
Design and verify a counter which supports loading a value and restarting from the last loaded value when the counter rolls-over. This is commonly known as a self-reloading counter.

Interface Definition
Counter should reset to 0
The module should have the following interface:
input     wire          clk,
input     wire          reset,
input     wire          load_i,     -> Load value is valid this cycle
input     wire[3:0]     load_val_i, -> 4-bit load value

output    wire[3:0]     count_o     -> Counter output
