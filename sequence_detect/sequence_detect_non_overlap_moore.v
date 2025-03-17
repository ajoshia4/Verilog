// Code your design here
module sequence_detect(clk,rst,in,out);
input clk, rst, in;
output reg out;

parameter IDLE = 3'b000 ;
parameter S1 =  3'b001;
parameter S10 = 3'b010;
parameter S101 = 3'b011;
parameter S1011 = 3'b100;

reg [2:0] current_state, next_state;

always @(posedge clk or posedge rst) begin
  if (rst) current_state <= IDLE;
    else current_state <= next_state; 
end

always@(*) begin
case (current_state)
   IDLE : begin 
     	  out =0;
         if(in==1) 
           begin
                next_state=S1;
            end
        else
            begin
                next_state=IDLE;
            end
   		end
    S1  : begin
      	  out = 0;
          if (in==0)
            begin
                next_state = S10;
            end
            else 
            begin
                next_state = S1;
            end
   		 end
    S10  : begin
      	   out = 0;
           if(in==1)
            begin
                next_state = S101;
            end
            else 
            begin
                next_state = IDLE;
            end
    	   end
    S101  : begin
      		out = 0;
            if(in==1) 
             begin
                next_state = S1011;
             end
            else 
             begin
                next_state = S10;
             end
    		end	
    S1011: begin
      		out =1;
            if(in==1) 
                begin
                    next_state = S1;
                end
            else
                begin
                    next_state =IDLE;
                end
    		end
    default: begin
            out=0;
            next_state = IDLE;
            end
endcase
end
endmodule
