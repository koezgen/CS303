`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2023 21:46:55
// Design Name: 
// Module Name: main
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


//module main(
//    output wire led_inside_0,
//    output wire led_inside_1,
//    output wire led_inside_2,
//    output wire led_inside_3,
//    output wire led_inside_4,
    
//    output wire led_outside_0,
//    output wire led_outside_1,
//    output wire led_outside_2,
//    output wire led_outside_3,
//    output wire led_outside_4,
    
//    output wire a,
//    output wire b,
//    output wire c,
//    output wire d,
//    output wire e,
//    output wire f,
//    output wire g,
//    output wire p,
//    output wire [7:0] an,
   
//    input clk,
//    input rst,
    
//    input BTNU,
//    input BTNL,
//    input BTNC,
//    input BTNR,
//    input BTND,
    
//    input direction_1,
//    input direction_2,
//    input direction_3,
    
//    input floor_0_d,
//    input floor_1_d,
//    input floor_2_d,
//    input floor_3_d,
//    input floor_4_d
//    );

//wire clk_in;
//wire floor_0;
//wire floor_1;
//wire floor_2;
//wire floor_3;
//wire floor_4;

//wire [7:0] A;
//wire [7:0] B;
//wire [7:0] C;
//wire [7:0] D;
//wire [7:0] E;
//wire [7:0] F;
//wire [7:0] G;
//wire [7:0] P;
//wire [7:0] AN;


//debouncer db0(.clk(clk), .rst(rst), .noisy_in(BTNU), .clean_out(floor_0));
//debouncer db1(.clk(clk), .rst(rst), .noisy_in(BTNL), .clean_out(floor_1));
//debouncer db2(.clk(clk), .rst(rst), .noisy_in(BTNC), .clean_out(floor_2));
//debouncer db3(.clk(clk), .rst(rst), .noisy_in(BTNR), .clean_out(floor_3));
//debouncer db4(.clk(clk), .rst(rst), .noisy_in(BTND), .clean_out(floor_4));

//clk_divider clk_div(.clk_in(clk), .rst(rst), .divided_clk(clk_in));

//elevator elev(.led_inside_0(led_inside_0), .led_inside_1(led_inside_1), .led_inside_2(led_inside_2), .led_inside_3(led_inside_3), .led_inside_4(led_inside_4),
//                         .led_outside_0(led_outside_0), .led_outside_1(led_outside_1), .led_outside_2(led_outside_2), .led_outside_3(led_outside_3), .led_outside_4(led_outside_4),
//                         .a(A[7:0]), .b(B[7:0]), .c(C[7:0]), .d(D[7:0]), .e(E[7:0]), .f(F[7:0]), .g(G[7:0]), .p(P[7:0]), .an(AN[7:0]), 
//                         .clk_in(clk_in), .rst(rst), 
//                         .floor_0_p(floor_0), .floor_1_p(floor_1), .floor_2_p(floor_2), .floor_3_p(floor_3), .floor_4_p(floor_4), 
//                         .floor_0_d(floor_0_d), .floor_1_d(floor_1_d), .floor_2_d(floor_2_d), .floor_3_d(floor_3_d), .floor_4_d(floor_4_d),
//                         .direction_1(direction_1), .direction_2(direction_2), .direction_3(direction_3)
//                        );
                 
//ssd display(.clk(clk), .reset(rst), .an(an), .a(A), .b(B), .c(C), .d(D), .e(E), .f(F), .g(G), .p(P), .a_out(a), .b_out(b), .c_out(c), .d_out(d), .e_out(e), .f_out(f), .g_out(g), .p_out(p));
//endmodule

module top_module(

    input clk,
    rst,
    
    floor_0_p,
    floor_1_p,
    floor_2_p,
    floor_3_p,
    floor_4_p,
    
    direction_1,
    direction_2,
    direction_3,
    
    floor_0_d,
    floor_1_d,
    floor_2_d,
    floor_3_d,
    floor_4_d,
    
    output led_inside_0,
    led_inside_1,
    led_inside_2,
    led_inside_3,
    led_inside_4,
    
    led_outside_0,
    led_outside_1,
    led_outside_2,
    led_outside_3,
    led_outside_4,

    led_busy_out,
    
    a_out,b_out,c_out,d_out,e_out,f_out,g_out,p_out,
    [7:0]an
);
    
    wire [7:0] a,b,c,d,e,f,g,p;
    wire clk50hz;
    
    assign clk50hz = clk;
    
    wire floor_0_p_clean;
    wire floor_1_p_clean;
    wire floor_2_p_clean;
    wire floor_3_p_clean;
    wire floor_4_p_clean;
    
    wire reset = ~rst;
    
//    clk_divider divider(.clk_in(clk), .rst(reset), .divided_clk(clk50hz));

//    debouncer pb0(.clk(clk50hz), .rst(reset), .noisy_in(floor_0_p), .clean_out(floor_0_p_clean));
//    debouncer pb1(.clk(clk50hz), .rst(reset), .noisy_in(floor_1_p), .clean_out(floor_1_p_clean));
//    debouncer pb2(.clk(clk50hz), .rst(reset), .noisy_in(floor_2_p), .clean_out(floor_2_p_clean));
//    debouncer pb3(.clk(clk50hz), .rst(reset), .noisy_in(floor_3_p), .clean_out(floor_3_p_clean));
//    debouncer pb4(.clk(clk50hz), .rst(reset), .noisy_in(floor_4_p), .clean_out(floor_4_p_clean));
    
//    ssd seven_segment_display(clk,reset,a,b,c,d,e,f,g,p,
//		a_out,b_out,c_out,d_out,e_out,f_out,g_out,p_out,
//		an);
		
	elevator elev(
	clk50hz,rst,
	floor_0_p,floor_1_p,floor_2_p,floor_3_p,floor_4_p,
	direction_1,direction_2,direction_3,
	floor_0_d,floor_1_d,floor_2_d,floor_3_d,floor_4_d,
	led_inside_0,led_inside_1,led_inside_2,led_inside_3,led_inside_4,
	led_outside_0,led_outside_1,led_outside_2,led_outside_3,led_outside_4, led_busy_out,
	a,b,c,d,e,f,g,p);
	
endmodule
