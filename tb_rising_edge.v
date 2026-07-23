`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2026 03:06:04 PM
// Design Name: 
// Module Name: tb_rising_edge
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_rising_edge();
    reg clk;
    reg signal;
    reg reset;
    
    wire outedge;
    
    rising_edge u1(.clk(clk), 
    .signal(signal), 
    .reset(reset), 
    .outedge(outedge));
    
    always #5 clk = ~clk;
    initial begin
    //initialize
    clk = 0;
    reset = 1;
    signal = 0;
    
    #30;
    reset = 0;
    #20;
    
    signal = 1;//long high, goes through all states
    #120;
    signal = 0;
    
    #80;//stays in state 0
    
    signal = 1;//goes through state 1, back to 0
    #40;
    signal = 0;
    
    #100;
    end

endmodule
