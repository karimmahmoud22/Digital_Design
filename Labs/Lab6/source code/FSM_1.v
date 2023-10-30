/////////////////////////////////////
///////////// Moore FSM ///////////// 
/////////////////////////////////////

module Moore_CIR (
input  wire        W,
input  wire        rst,
input  wire        clk,
output reg         Z
);



localparam  [1:0]   A = 2'b00,
                     B = 2'b01,
						   C = 2'b10;
					 
reg    [1:0]         current_state,
                     next_state ;
		
// state transition 		
always @(posedge clk or negedge rst)
 begin
  if(!rst)
   begin
     current_state <= A ;
   end
  else
   begin
     current_state <= next_state ;
   end
 end
 
// next_state logic
always @(*)
 begin
  case(current_state)
  A     : begin
              if(W)
			   next_state = B ;
              else
               next_state = A ;			  
             end
  B       : begin
            if(W)
			   next_state = C ;
			  else
               next_state = A ;   
            end
  C     : begin
              if(W)
					next_state = C ;
              else
               next_state = A ;	    
            end
	
  default :   next_state = A ;		 
  
  endcase
end	


// next_state logic
always @(*)
 begin
  case(current_state)
  A     : begin
              Z   =  1'b0 ;		  
             end
  B       : begin
              Z   =  1'b0 ;
             end	
  C      : begin
              Z   =  1'b1 ;	   
             end
  default  : begin
              Z   =  1'b0 ;
             end			  
  endcase
 end	
		
		
endmodule					 