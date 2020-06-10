//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:Matthew
// Date: 6/8/2020
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    //Todo: define inputs here
	input a,
    	input b,
    	input sel,
    	output out
    );
    
    //Todo: define registers and wires here
	wire out;

    //Todo: define your logic here
	assign out= sel?b:a;
              
      
endmodule
