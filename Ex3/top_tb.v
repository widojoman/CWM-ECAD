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
    parameter Test_period = 1000; //in terms of time period, how long will the counter run for

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
    initial
    begin
    	rst=1;
    	direction = 1;
	   enable = 0;
	    err = 0;
	    //Running code

	   #50 rst=0; //rst to zero so it works
	   //Testing if rst works
	   #CLK_PERIOD
	   if (counter_out!=0)
	   begin
    	   $display("Test Failed reset");
    	   err=1;
        end
	   
	   #50 enable=1;
	   #50 enable=0;
	   #50 enable=1;
	   #100 direction=0;
	   #100 direction=1;
	   #100 rst=1;
	   #50 rst=0;
	   

    end

//Todo: Finish test, check for success
    initial
    begin
    	#Test_period 
    	if (err==0)
    	   $display("Test Passed :)");
	

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
