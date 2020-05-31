//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #2 - multiplexer
// Author: Noa Zilberman
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg [1:0] ab;
    reg sel;
    reg err;
    wire out;
    
    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
       ab=0;
       err=0;
       sel=0;
       forever begin
         #CLK_PERIOD
         if ((sel&(out!=ab[0]))| (!sel&(out!=ab[1])))
         begin
           $display("***TEST FAILED! a==%d, b==%d, sel='%d', actual out=%d ***",ab[1],ab[0],sel,out);
           err=1;
         end
         ab=ab+1;
         if (ab==0)
           sel=~sel;
       end
     end

     //Finish simulation and check for success
     initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end
     
     //User's module
     mux top (
     .a (ab[1]),
     .b (ab[0]),
     .sel (sel),
     .out (out)
     );
     
     
endmodule 
