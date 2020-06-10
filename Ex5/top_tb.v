//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:Matt
// Date: 6/10/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
    parameter CLK_PERIOD = 10; //sets clock period, of 10 time units
    parameter Test_period = 100; //in terms of time period, how long will the counter run for

//Todo: Registers and wires
    reg clk;
    reg err;
    reg [2:0] prev_counter;
    wire red;
    wire amber;
    wire green;

  
    
//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

//Todo: User logic
    initial begin
	err = 0;

	//Tests
	forever begin
		prev_counter = {red,amber,green};	   
		#CLK_PERIOD;
		if ((red==1'b0 && amber==1'b0 && green==1'b0)
			||(red==1'b1 && amber==1'b0 && green==1'b1)
			||(red==1'b0 && amber==1'b1 && green==1'b1)
			||(red==1'b1 && amber==1'b1 && green==1'b1)) 
			begin
   	   		$display("Test Returns invalid numbers");
   	   		err=1;
       		end

		if (prev_counter == {red,amber,green})
			begin
   	   		$display("Test didn't change");
   	   		err=1;
       		end
		
	end
	end

//Todo: Finish test, check for success
    initial
    begin
    	#Test_period 
    	if (err==0)
    	   $display("***Test Passed :)");
	

    	$finish;
    end

//Todo: Instantiate counter module
    lights top(
	.clk (clk),
	.red (red),
	.amber (amber),
	.green (green)
	);

endmodule
