//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:Matthew
// Date: 6/9/2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module dice(
    //Todo: add ports 
    input rst,
    input button,
    input clk,
    output reg [2:0] throw_out
    );               
    //Todo: add registers and wires, if needed

    //Todo: add user logic

    
    always@(posedge clk)
    if (rst||(throw_out==3'b000)||(throw_out==3'b111)) begin
        throw_out <=3'b001;
    end
    else begin
        if(button==0)begin
            throw_out <= throw_out;
        end
        else begin
            throw_out <= (throw_out==3'b110)?3'b001:throw_out+1;
        end
    end
		  
    
 
    
endmodule
