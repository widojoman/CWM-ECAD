//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    //Todo: add ports 
    input rst,
    input enable,
    input direction,
    input clk,
    output [7:0] counter_out
    );               
    //Todo: add registers and wires, if needed
    reg [7:0] counter;

    //Todo: add user logic
    assign counter_out=counter;
    
    always@(posedge clk)
	counter<= rst?2'b0:enable?direction?counter+1:counter-1:counter;
		  
    
 
    
endmodule
