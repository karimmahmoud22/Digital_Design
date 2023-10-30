module test_bench_bcd();

  reg  [3:0] x;
  reg  [3:0] y;
  wire  [3:0] s;
  wire carry;
  
  integer counter;

  BCD_adder_final BCD_adder_final1 ( x , y , s , carry );
  
  initial begin
    counter=0;

  /*--------------------------------------First Test Case--------------------------------------*/  
    #20;
    
    x = 4'b0101;
    y = 4'b0101;

    #50;

    $display( "inputA:%d , inputB:%d , s:%d , carry:%d \n",x , y , s , carry ) ;

    if ( s == 4'b0000 && carry == 0 ) begin
		$display( "TestCase# 1 : SUCCESS  \n" ) ;
		counter=counter+1;
    end
    else begin
		$display( "TestCase# 1 : FAILED  \n" ) ;
    end

	/*--------------------------------------Second Test Case--------------------------------------*/  
    #20;
    
    x = 4'b1001;
    y = 4'b1001;

    #50;

    $display( "inputA:%d , inputB:%d , s:%d , carry:%d \n",x , y , s , carry ) ;

    if ( s == 4'b1000 && carry == 1 ) begin
		$display( "TestCase# 2 : SUCCESS  \n" ) ;
		counter=counter+1;
    end
    else begin
		$display( "TestCase# 2 : FAILED  \n" ) ;
    end
	 
	/*--------------------------------------Second Test Case--------------------------------------*/  

    #20;
    
    x = 4'b0111;
    y = 4'b1000;

    #50;

    $display( "inputA:%d , inputB:%d , s:%d , carry:%d \n",x , y , s , carry ) ;

    if ( s == 4'b0101 && carry == 0 ) begin
		$display( "TestCase# 4 : SUCCESS  \n" ) ;
		counter=counter+1;
    end
    else begin
		$display( "TestCase# 4 : FAILED  \n" ) ;
    end
	 

    #100
    $display( "The number of success test cases:%d  \n", counter ) ;



  end

endmodule