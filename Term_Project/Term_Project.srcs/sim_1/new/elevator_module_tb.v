`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2023 21:52:47
// Design Name: 
// Module Name: elevator_module_tb
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


module elevator_module_tb;

wire led_busy;

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

elevator dut(

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
    
    .clk(clock),
    .rst(reset),
    
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
    #10000
    reset <= 1;
    #30000
    reset <= 0;
    
    direction_3 <= 1;
    floor_3_p <= 1;
    #10000000
    floor_3_p <= 0;

end

initial $finish;

endmodule
