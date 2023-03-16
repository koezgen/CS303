`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2022 10:31:00
// Design Name: 
// Module Name: mod_7_serial_tb
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

module mod_7_serial_tb;

reg Reset;
reg Enable;
reg Serial_in;
reg Clk;
reg [2:0] Configure;

wire [2:0] Out;
wire Led;

main uut(
    .reset(Reset),
    .enable(Enable),
    .serial_in(Serial_in),
    .clk(Clk),
    .configure(Configure),
    .out(Out),
    .led(Led)
    );

always
    #1 Clk = ~Clk;

initial begin
    Reset <= 1;
    #100
    Reset <= 0;
    #100
    Clk = 0;    
    Enable = 1;
    Configure = 3'b110;
    Serial_in <= 1;
    #100000
    Serial_in <= 0;
    #100000
    Serial_in <= 1;
    #100000
    Serial_in <= 0;
    #100000
    Serial_in <= 1;
    #100000
    Serial_in <= 0;
    #100000
    Serial_in <= 1;
    #100000
    Serial_in <= 0;
    #100000
    Serial_in <= 1;
    #100000
    Serial_in <= 0;
    #100000
    Serial_in <= 1;
    #100000
    Serial_in <= 0;
    #100000
    Serial_in <= 1;
    #100000
    Serial_in <= 0;
    #100000
    Serial_in <= 1;
    #100000
    Serial_in <= 1;
    Enable <= 0;
end

initial $finish;

endmodule
   