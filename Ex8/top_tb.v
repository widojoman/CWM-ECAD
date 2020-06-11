//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps


module top_tb(
    );
//Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    	reg clk;
	reg [2:0] a;
	reg [2:0] b;
	reg enable;
	reg reset;
	wire [5:0] out;
	reg err;
	reg [5:0] out_prev;

//Todo: Clock generation
initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=!clk;
     end

//Todo: User logic
    initial begin
    	a=1;
	b=1;
	err = 0;
	enable=1;
	reset=0;
	//Running code
    #30
    reset=1;

	//Tests
	   
	
	forever begin
		#30 a=a+1;
		if (a==3'd7)
			begin
   	   		a=1;
   	   		b=b+1;
        end
        #20
        if (out==out_prev)
        begin
            $display("Test Returns invalid numbers");
            err=1;
        end
        
		out_prev = out;	
		
		

	end
	
	end

//Todo: Finish test, check for success
    initial
    begin
    	#600
    	if (err==0)
    	   $display("***Test Passed :)");
	

    	$finish;
    end

    //User's module
    times_table top (
	.clk (clk),
	.enable (enable),
	.reset (reset),
	.a (a),
	.b (b),
	.out (out)
     );	

endmodule
