// Code your design here
// Code your design here
// Code your design here
module divisible_by_3 (clk,rst_n,bit_in,out);
  input clk,rst_n;
  input bit_in;
  output reg out;
  
  reg [1:0] current_state, next_state;
 parameter S0=2'b00, S1=2'b01, S2=2'b10;
  
  always@(posedge clk or negedge rst_n) begin
    if(!rst_n) current_state<=S0;
    else current_state<=next_state;
  end
  
  always@(*)
    case(current_state)
      S0: begin out=1; 
      	if(bit_in == 0) 
        	begin
        		next_state = S0;
      		end
      	else
          begin
            	next_state = S1;
          end
      end
    S1: begin out=0;
      	if(bit_in == 0) 
        	begin
        		next_state = S2;
      		end
      	else
          begin
            	next_state = S0;
          end
    end
      S2: begin out=0;
      	if(bit_in == 0) 
        	begin
        		next_state = S1;
      		end
      	else
          begin
            	next_state = S2;
          end
      end
      default: begin
        		out = 0;
        		next_state = S0;
      end
    endcase
endmodule
