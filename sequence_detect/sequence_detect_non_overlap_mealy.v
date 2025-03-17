// Code your design here
module sequence_detect(clk,rst,in,out);
input clk, rst, in;
output reg out;

parameter IDLE = 2'b00 ;
parameter S1 =  2'b01;
parameter S10 = 2'b10;
parameter S101 = 2'b11;

reg [1:0] current_state, next_state;

always @(posedge clk or posedge rst) begin
    if (rst) current_state <=IDLE;
    else current_state <= next_state; 
end

always@(*) begin
case (current_state)
   IDLE : if(in==1) 
           begin
                out=0;
                next_state=S1;
            end
            else
            begin
                out=0;
                next_state=IDLE;
            end
    S1  : if (in==0)
            begin
                out=0;
                next_state = S10;
            end
            else 
            begin
                out=0;
                next_state = S1;
            end
    S10  :   if(in==1)
            begin
                out=0;
                next_state = S101;
            end
            else 
            begin
                out=0;
                next_state = IDLE;
            end
    S101  : if(in==1) 
            begin
                out=1;
                next_state = IDLE;
            end
            else 
            begin
                out=0;
                next_state = S10;
            end
    default: begin
            out=0;
            next_state = IDLE;
            end
endcase
end
endmodule
