module test_bench_comparator();

  reg  [3:0] x;
  reg  [3:0] y;
  wire z,v,n;
  
  integer counter;

  four_bit_comparator four_bit_comparator1 ( x , y , v , n , z);
  
  initial begin
    counter=0;

  /*--------------------------------------First Test Case--------------------------------------*/  
    #20;
    
    x = 4'b0101;
    y = 4'b0011;

    #50;

    $display( "inputA:%d , inputB:%d , z:%d , v:%d n:%d  \n",$signed(x) , $signed(y) , $signed(z) , $signed(v) , $signed(n) ) ;

    if ( $signed(z) == 0 && $signed(n) == 0 && $signed(v) == 0 ) begin
		$display( "TestCase# 1 : SUCCESS  \n" ) ;
		counter=counter+1;
    end
    else begin
		$display( "TestCase# 1 : FAILED  \n" ) ;
    end

	/*--------------------------------------Second Test Case--------------------------------------*/  

    #20;
    
    x = 4'b0101;
    y = 4'b0101;

    #50;

    $display( "inputA:%d , inputB:%d , z:%d , v:%d n:%d  \n",x , y , z , v , n ) ;

    if ( z == 1 && n == 0 && v == 0 ) begin
		$display( "TestCase# 2 : SUCCESS  \n" ) ;
		counter=counter+1;
    end
    else begin
		$display( "TestCase# 2 : FAILED  \n" ) ;
    end

    #100
    $display( "The number of success test cases:%d  \n", counter ) ;

	/*--------------------------------------Second Test Case--------------------------------------*/  

    #20;
    
    x = 4'b0101;
    y = 4'b0110;

    #50;

    $display( "inputA:%d , inputB:%d , z:%d , v:%d n:%d  \n",x , y ,z , v , n ) ;

    if ( z == 0 && n == 1 && v == 0 ) begin
		$display( "TestCase# 3 : SUCCESS  \n" ) ;
		counter=counter+1;
    end
    else begin
		$display( "TestCase# 3 : FAILED  \n" ) ;
    end

    #100
    $display( "The number of success test cases:%d  \n", counter ) ;

	/*--------------------------------------Second Test Case--------------------------------------*/  

    #20;
    
    x = 4'b0000;
    y = 4'b0001;

    #50;

    $display( "inputA:%d , inputB:%d , z:%d , v:%d n:%d  \n",x , y , z , v , n ) ;

    if ( z == 0 && n == 1 && v == 0 ) begin
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