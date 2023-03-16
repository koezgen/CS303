`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2022 11:46:10
// Design Name: 
// Module Name: clockcounter_tb
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


module clockcounter_tb;

wire Cnt_out;
wire Led;
//wire [31:0] Count;
//wire [31:0] Max_count;

reg Clk;
reg Reset;
reg Enable;
reg [2:0] Configure;

clockcounter uut(
    .cnt_out(Cnt_out),
    .led(Led),
    //.count(Count),
    //.max_count(Max_count),
    .clk(Clk),
    .reset(Reset),
    .enable(Enable),
    .configure(Configure));

always
    #1 Clk = ~Clk;
    
initial begin
    Enable <= 1;
    Reset <= 1;
    #10
    Reset <= 0;
    Clk <= 0;
    Configure <= 3'b000;
end

initial #10000000 $finish;    
endmodule 