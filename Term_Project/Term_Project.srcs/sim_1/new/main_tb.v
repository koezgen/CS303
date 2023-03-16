`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2023 21:51:46
// Design Name: 
// Module Name: main_tb
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


module main_tb;

wire led_busy_out;

wire led_inside_0;
wire led_inside_1;
wire led_inside_2;
wire led_inside_3;
wire led_inside_4;

wire led_outside_0;
wire led_outside_1;
wire led_outside_2;
wire led_outside_3;
wire led_outside_4;

wire a_out;
wire b_out;
wire c_out;
wire d_out;
wire e_out;
wire f_out;
wire g_out;
wire p_out;
wire [7:0] an;

reg direction_1;
reg direction_2;
reg direction_3;

reg floor_0_d;
reg floor_1_d;
reg floor_2_d;
reg floor_3_d;
reg floor_4_d;

reg floor_1_p;
reg floor_0_p;
reg floor_2_p;
reg floor_4_p;
reg floor_3_p;

reg clock;
reg reset;

top_module uut(
    .led_inside_0(led_inside_0),
    .led_inside_1(led_inside_1),
    .led_inside_2(led_inside_2),
    .led_inside_3(led_inside_3),
    .led_inside_4(led_inside_4),
    
    .led_outside_0(led_outside_0),
    .led_outside_1(led_outside_1),
    .led_outside_2(led_outside_2),
    .led_outside_3(led_outside_3),
    .led_outside_4(led_outside_4),
    
    .a_out(a_out),
    .b_out(b_out),
    .c_out(c_out),
    .d_out(d_out),
    .e_out(e_out),
    .f_out(f_out),
    .g_out(g_out),
    .p_out(p_out),
    .an(an),
   
    .clk(clock),
    .rst(reset),
    .led_busy_out(led_busy_out),
    
    .floor_1_p(floor_1_p),
    .floor_0_p(floor_0_p),
    .floor_2_p(floor_2_p),
    .floor_4_p(floor_4_p),
    .floor_3_p(floor_3_p),
    
    .direction_1(direction_1),
    .direction_2(direction_2),
    .direction_3(direction_3),
    
    .floor_0_d(floor_0_d),
    .floor_1_d(floor_1_d),
    .floor_2_d(floor_2_d),
    .floor_3_d(floor_3_d),
    .floor_4_d(floor_4_d)
    );

always
#10 clock = ~clock;

initial
begin
    clock <= 1;
    
    //global reset
    #100
    reset <= 0;
    #300
    reset <= 1;
    
    #50000
    
    floor_4_p <= 1;
    #100
    floor_4_p <= 0;
    
    #500
    
    direction_3 <= 1;
    floor_3_p <= 1;
    #100
    direction_3 <= 0;
    floor_3_p <= 0;
    
    #50000
    
    floor_1_d <= 1;
    #100
    floor_1_d <= 0;
    
    #500
        
    direction_2 <= 0;
    floor_2_p <= 1;
    #100
    direction_2 <= 1;
    floor_2_p <= 0;

    #50000
    
    direction_1 <= 0;
    floor_1_p <= 1;
    #100
    direction_1 <= 1;
    floor_1_p <= 0;
    
    
end

initial $finish;

endmodule
