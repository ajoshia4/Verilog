
    module digital_clock(clk,rst,seconds,minutes,hours);
    input clk, rst;
    output reg [5:0] seconds, minutes;
    output reg [4:0] hours;

//for seconds
    always @(posedge clk or posedge rst) begin
        if (rst) seconds<=0;
      else if (seconds==59) seconds<=0;
        else seconds<=seconds+1;
    end

//for minutes
    always @(posedge clk or posedge rst) begin
        if(rst) minutes<=0;
      else if (seconds==59) begin
              if(minutes==59) minutes<=0;
              else minutes<=minutes+1;
      end
        else minutes<=minutes;
    end
//for hours
    always @(posedge clk or posedge rst) begin
        if(rst) hours<=0;
      else if (seconds==59 && minutes==59) begin
             if (hours==23) hours<=0;
             else hours<=hours+1;
      end
        else hours<=hours;
    end
    endmodule
