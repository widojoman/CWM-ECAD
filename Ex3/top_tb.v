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
    parameter Test_period = 100; //in terms of time period, how long will the counter run for
				//(goes up and down back to zero)

//Todo: Registers and wires
    reg clk;
    reg rst;
    reg direction;
    reg enable;
    reg err;
    wire [2:0] counter_out;
//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

//Todo: User logic
    initial
    begin
    	rst=1; //reset counter to start
    	direction = 1;
	enable = 1;
	err = 0;

	#1 rst=0; //rst to zero so it works

    end

//Todo: Finish test, check for success
    initial
    begin
    	#Test_period 
	

    	$finish;
    end

//Todo: Instantiate counter module
    counter top(
	.rst (rst),
	.enable (enable),
	.direction (direction),
	.clk (clk),
	.counter_out (counter_out[2:0])
	);

endmodule
