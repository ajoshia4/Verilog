    module digital_clock(clk,rst,seconds, minutes,hours);
    input clk, rst;
    output [5:0] seconds, minutes;
    output [3:0] hours;
    reg [5:0] seconds_count=0, minutes_count=0;
    reg [3:0] hours_count=0;
    reg start_clock;
   // parameter IDLE =0, S0=1;

    always@(posedge clk)
        begin   
            if(rst) start_clock=0;
            else start_clock=1;
        end

//for seconds
    always @(posedge clk) begin
        case(start_clock)
        0: seconds_count<=0;
        1:  if(seconds_count!=59) seconds_count<=seconds_count+1;
            else seconds_count<=0;
    endcase
    end

//for minutes
    always @(posedge clk) begin
        case(start_clock)
        0: minutes_count<=0;
        1: if (seconds_count==59 && minutes_count==59) minutes_count<=0;
            else if(seconds_count==59 && minutes_count!=59) minutes_count<=minutes_count+1;
            else minutes_count<=minutes_count;
    endcase
    end

    always @(posedge clk) begin
        case(start_clock)
        0: hours_count<=0;
        1: if (seconds_count==59 && minutes_count==59 && hours_count==11) hours_count<=0;
            else if(seconds_count==59 && minutes_count==59 && hours_count!=11) hours_count<=hours_count+1;
            else hours_count<=hours_count;
    endcase
    end

    assign seconds=seconds_count;
    assign minutes=minutes_count;
    assign hours=hours_count;
    endmodule