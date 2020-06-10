//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:Matthew
// Date: 06/10/2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module muxover(
    //Todo: define inputs here
	input rst,
    	input clk,
    	input sel,
	input button,
    	output wire [2:0] out
    );
    
    //Todo: define registers and wires here
	wire throw[2:0];
	wire b[2:0];

    //Todo: define your logic here

	
//Todo: Instantiate modules
    lights lights(
	.clk (clk),
	.red (b[2]),
	.amber (b[1]),
	.green (b[0])
	);
	
    dice dice(
	.rst (rst),
	.button (button),
	.clk (clk),
	.throw_out (throw)
	);

    mux multiplexer (
     .a (throw),
     .b (b),
     .sel (sel),
     .out (out)
     );          
      
endmodule
