//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:Matt
// Date: 6/10/2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module lights(
    //Todo: add ports 
    input clk,
    output reg red=1'b1,
    output reg amber=1'b0,
    output reg green=1'b0
    );               
    //Todo: add registers and wires, if needed

    //Todo: add user logic

    
    always@(posedge clk)
    if ((red==1'b0 && amber==1'b0 && green==1'b0)
	||(red==1'b1 && amber==1'b0 && green==1'b1)
	||(red==1'b0 && amber==1'b1 && green==1'b1)
	||(red==1'b1 && amber==1'b1 && green==1'b1)) 
    begin
        red <=1'b1;
	amber <=1'b0;
	green <=1'b0;
    end else if(red==1'b1 && amber==1'b0 && green==1'b0)begin
        red <=1'b1;
	amber <=1'b1;
	green <=1'b0;
    end else if(red==1'b1 && amber==1'b1 && green==1'b0)begin
        red <=1'b0;
	amber <=1'b0;
	green <=1'b1;
    end else if(red==1'b0 && amber==1'b0 && green==1'b1)begin
        red <=1'b0;
	amber <=1'b1;
	green <=1'b0;
    end else begin
        red <=1'b1;
	amber <=1'b0;
	green <=1'b0;
    end
    
		  
    
 
    
endmodule
