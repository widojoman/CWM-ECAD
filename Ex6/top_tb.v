//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
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
    reg sel;
    reg [2:0] prev_counter;
    wire [2:0] out;

  
    
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
	sel=0;
	//Running code

	#50 rst=0; //rst to zero so it works

	//Tests
	prev_counter = out;	   
	#30;
	if (!(out>prev_counter))
		begin
   		$display("Test Failed to ascend");
   		err=1;
	end
	button=0;
	#20
	prev_counter = out;
	#30;
	if (!(out==prev_counter))
		begin
   		$display("Test Failed to pause");
   		err=1;
		end
	prev_counter = out;
	button=1;
	#20
	if (out==3'd111 || 3'd000)
	begin
   		$display("Test went out of bounds");
   		err=1;
	end
	#200
	
	forever begin
		sel=1;
		prev_counter = {out[2],out[1],out[0]};	   
		#CLK_PERIOD;
		if ((out[2]==1'b0 && out[1]==1'b0 && out[0]==1'b0)
			||(out[2]==1'b1 && out[1]==1'b0 && out[0]==1'b1)
			||(out[2]==1'b0 && out[1]==1'b1 && out[0]==1'b1)
			||(out[2]==1'b1 && out[1]==1'b1 && out[0]==1'b1)) 
			begin
   	   		$display("Test Returns invalid numbers");
   	   		err=1;
       		end

		if (prev_counter == {out[2],out[1],out[0]})
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
    muxover top(
	.rst (rst),
	.button (button),
	.clk (clk),
	.sel (sel),
	.out (out[2:0])
	);

endmodule
