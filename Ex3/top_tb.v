//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:Matthew
// Date: 6/8/2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
    parameter CLK_PERIOD = 10; //sets clock period, of 10 time units
    parameter Test_period = 600; //in terms of time period, how long will the counter run for

//Todo: Registers and wires
    reg clk;
    reg rst;
    reg direction;
    reg enable;
    reg err;
    wire [7:0] counter_out;
    reg [7:0] prev_counter;
    
//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

//Todo: User logic
    initial begin
    	rst=1;
    	direction = 1;
	enable = 1;
	err = 0;
	//Running code

	#50 rst=0; //rst to zero so it works

	//Tests
	forever begin
		prev_counter <= counter_out;	   
		#80;
		if (!(counter_out>prev_counter))
			begin
   	   		$display("Test Failed to ascend");
   	   		err<=1;
       		end
		prev_counter = counter_out;
		enable=0;
		#50;
		if (!(counter_out==prev_counter))
			begin
   	   		$display("Test Failed to pause");
   	   		err=1;
       			end
		prev_counter = counter_out;
		enable=1;
		direction=0;
		#50
		if (!(counter_out<prev_counter))
		begin
   	   		$display("Test Failed to descend");
   	   		err=1;
       	end
		rst=1;
		#30
		if (!(counter_out==0))
			begin
   	   		$display("Test Failed to reset");
   	   		err=1;
       			end
		
		rst=0;
		direction=1;
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
    counter top(
	.rst (rst),
	.enable (enable),
	.direction (direction),
	.clk (clk),
	.counter_out (counter_out[7:0])
	);

endmodule
