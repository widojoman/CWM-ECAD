//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:Matthew
// Date: 6/9/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
    parameter CLK_PERIOD = 10; //sets clock period, of 10 time units
    parameter Test_period = 600; //in terms of time period, how long will the counter run for

//Todo: Registers and wires
    reg rst;
    reg button;
    reg clk;
    reg err;
    reg [2:0] prev_counter;
    wire [2:0] throw_out;

  
    
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
	button = 1;
	err = 0;
	//Running code

	#50 rst=0; //rst to zero so it works

	//Tests
	forever begin
		prev_counter = throw_out;	   
		#30;
		if (!(throw_out>prev_counter))
			begin
   	   		$display("Test Failed to ascend");
   	   		err=1;
       		end
		prev_counter = throw_out;
		button=0;
		#50;
		if (!(throw_out==prev_counter))
			begin
   	   		$display("Test Failed to pause");
   	   		err=1;
       			end
		prev_counter = throw_out;
		button=1;
		if (throw_out==3'd111||3'd000)
		begin
   	   		$display("Test went out of bounds");
   	   		err=1;
       	end
		#500
		rst=1;
		if (!(throw_out==0))
			begin
   	   		$display("Test Failed to reset");
   	   		err=1;
       			end
		
		rst=0;
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
    dice top(
	.rst (rst),
	.button (button),
	.clk (clk),
	.throw_out (throw_out[2:0])
	);

endmodule
