`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2023 21:52:19
// Design Name: 
// Module Name: elevator_module
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

module elevator(

input clk_50hz, rst, floor_0_p, floor_1_p, floor_2_p, floor_3_p, floor_4_p,
direction_1, direction_2, direction_3,
floor_0_d, floor_1_d, floor_2_d, floor_3_d, floor_4_d,

output reg led_inside_0, led_inside_1, led_inside_2, led_inside_3, led_inside_4,
led_outside_0, led_outside_1, led_outside_2, led_outside_3, led_outside_4,
led_busy_out,
reg [7:0] a,b,c,d,e,f,g,p
);

parameter IDLE = 2'b00;
parameter DOWN = 2'b01;
parameter UP = 2'b10;

parameter FL0 = 3'b000;
parameter FL1 = 3'b001;
parameter FL2 = 3'b010;
parameter FL3 = 3'b011;
parameter FL4 = 3'b100;

reg [1:0] elev_state;
reg [2:0] floor;
reg [12:0] counter;
reg [2:0] queue;
reg led_busy;

always @(posedge clk_50hz or negedge rst) 
begin

    if (~rst)
        elev_state <= IDLE;
        
    else if (floor > queue)
        elev_state <= DOWN;
        
    else if (floor < queue)
        elev_state <= UP;
    
    else 
        elev_state <= IDLE;    
end

always @(posedge clk_50hz)
begin
    
    case (elev_state)
    
        IDLE: begin
        
            case (floor)
                FL0: begin a[7:0] <= 8'b11110110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101010; e[7:0] <= 8'b11100010; f[7:0] <= 8'b11110010; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
                FL1: begin a[7:0] <= 8'b11110111; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101011; e[7:0] <= 8'b11100011; f[7:0] <= 8'b11110011; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
                FL2: begin a[7:0] <= 8'b11110110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001111; d[7:0] <= 8'b11101010; e[7:0] <= 8'b11100010; f[7:0] <= 8'b11110011; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                FL3: begin a[7:0] <= 8'b11110110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101010; e[7:0] <= 8'b11100011; f[7:0] <= 8'b11110011; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                FL4: begin a[7:0] <= 8'b11110111; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101011; e[7:0] <= 8'b11100011; f[7:0] <= 8'b11110010; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                default: begin a[7:0] <= 8'b11110110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101010; e[7:0] <= 8'b11100010; f[7:0] <= 8'b11110010; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
            endcase
        end
          
        UP: begin
        
            case (floor)
                FL0: begin a[7:0] <= 8'b11100110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11011110; d[7:0] <= 8'b11011010; e[7:0] <= 8'b11000010; f[7:0] <= 8'b11000010; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
                FL1: begin a[7:0] <= 8'b11100111; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11011110; d[7:0] <= 8'b11011011; e[7:0] <= 8'b11000011; f[7:0] <= 8'b11000011; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
                FL2: begin a[7:0] <= 8'b11100110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11011111; d[7:0] <= 8'b11011010; e[7:0] <= 8'b11000010; f[7:0] <= 8'b11000011; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                FL3: begin a[7:0] <= 8'b11100110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11011110; d[7:0] <= 8'b11011010; e[7:0] <= 8'b11000011; f[7:0] <= 8'b11000011; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                FL4: begin a[7:0] <= 8'b11100111; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11011110; d[7:0] <= 8'b11011011; e[7:0] <= 8'b11000011; f[7:0] <= 8'b11000010; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                default: begin a[7:0] <= 8'b11100110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11011110; d[7:0] <= 8'b11011010; e[7:0] <= 8'b11000010; f[7:0] <= 8'b11000010; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
            endcase
        end
                           
        DOWN: begin
            
            case (floor)
                FL0: begin a[7:0] <= 8'b11100110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11001010; e[7:0] <= 8'b11000010; f[7:0] <= 8'b11100010; g[7:0] <= 8'b11010111; p[7:0] <= 8'b11111111; end
                FL1: begin a[7:0] <= 8'b11100111; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11001011; e[7:0] <= 8'b11000011; f[7:0] <= 8'b11100011; g[7:0] <= 8'b11010111; p[7:0] <= 8'b11111111; end
                FL2: begin a[7:0] <= 8'b11100110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001111; d[7:0] <= 8'b11001010; e[7:0] <= 8'b11000010; f[7:0] <= 8'b11100011; g[7:0] <= 8'b11010110; p[7:0] <= 8'b11111111; end
                FL3: begin a[7:0] <= 8'b11100110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11001010; e[7:0] <= 8'b11000011; f[7:0] <= 8'b11100011; g[7:0] <= 8'b11010110; p[7:0] <= 8'b11111111; end
                FL4: begin a[7:0] <= 8'b11100111; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11001011; e[7:0] <= 8'b11000011; f[7:0] <= 8'b11100010; g[7:0] <= 8'b11010110; p[7:0] <= 8'b11111111; end
                default: begin a[7:0] <= 8'b11100110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11001010; e[7:0] <= 8'b11000010; f[7:0] <= 8'b11100010; g[7:0] <= 8'b11010111; p[7:0] <= 8'b11111111; end
            endcase
        end
        
        default: begin
        
            case (floor)
                FL0: begin a[7:0] <= 8'b11110110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101010; e[7:0] <= 8'b11100010; f[7:0] <= 8'b11110010; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
                FL1: begin a[7:0] <= 8'b11110111; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101011; e[7:0] <= 8'b11100011; f[7:0] <= 8'b11110011; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
                FL2: begin a[7:0] <= 8'b11110110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001111; d[7:0] <= 8'b11101010; e[7:0] <= 8'b11100010; f[7:0] <= 8'b11110011; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                FL3: begin a[7:0] <= 8'b11110110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101010; e[7:0] <= 8'b11100011; f[7:0] <= 8'b11110011; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                FL4: begin a[7:0] <= 8'b11110111; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101011; e[7:0] <= 8'b11100011; f[7:0] <= 8'b11110010; g[7:0] <= 8'b11100110; p[7:0] <= 8'b11111111; end
                default: begin a[7:0] <= 8'b11110110; b[7:0] <= 8'b11001110; c[7:0] <= 8'b11001110; d[7:0] <= 8'b11101010; e[7:0] <= 8'b11100010; f[7:0] <= 8'b11110010; g[7:0] <= 8'b11100111; p[7:0] <= 8'b11111111; end
            endcase
        end
                 
     endcase
end


always @(posedge clk_50hz, negedge rst)
begin

    if (~rst) begin
    queue <= 0;
    
    led_outside_0 <= 0;
    led_outside_1 <= 0;
    led_outside_2 <= 0;
    led_outside_3 <= 0;
    led_outside_4 <= 0;
    
    led_inside_0 <= 0;
    led_inside_1 <= 0;
    led_inside_2 <= 0;
    led_inside_3 <= 0;
    led_inside_4 <= 0;
    end
    
    else if (~led_busy) begin
        case (elev_state)
            
            IDLE: begin
                if (floor_0_p == 1) begin led_outside_0 = 1; queue <= FL0; end else if (floor_4_p == 1) begin led_outside_4 = 1; queue <= FL4; end 
                else if (floor_1_p == 1) begin led_outside_1 = 1; queue <= FL1; end else if (floor_2_p == 1) begin led_outside_2 = 1; queue <= FL2; end
                else if (floor_3_p == 1) begin led_outside_3 = 1; queue <= FL3; end
                
                else if (floor_0_d == 1) begin led_inside_0 = 1; queue <= FL0; end else if (floor_4_d == 1) begin led_inside_4 = 1; queue <= FL4; end 
                else if (floor_1_d == 1) begin led_inside_1 = 1; queue <= FL1; end else if (floor_2_d == 1) begin led_inside_2 = 1; queue <= FL2; end
                else if (floor_3_d == 1) begin led_inside_3 = 1; queue <= FL3; end
                
                else if (floor == FL0) begin led_inside_0 = 0; led_outside_0 = 0; end
                else if (floor == FL1) begin led_inside_1 = 0; led_outside_1 = 0; end
                else if (floor == FL2) begin led_inside_2 = 0; led_outside_2 = 0; end
                else if (floor == FL3) begin led_inside_3 = 0; led_outside_3 = 0; end
                else if (floor == FL4) begin led_inside_4 = 0; led_outside_4 = 0; end
            end
                
            DOWN: begin
                 if ((floor_0_p == 1) && ((queue < FL0)|(queue == FL0)) && ((floor > FL0))) led_outside_0 = 1;
                 else if ((floor_1_p == 1) && (direction_1 == 0) && ((queue < FL1)||(queue == FL1)) && (floor > FL1)) led_outside_1 = 1;
                 else if ((floor_2_p == 1) && (direction_2 == 0) && ((queue < FL2)||(queue == FL2)) && (floor > FL2)) led_outside_2 = 1;
                 else if ((floor_3_p == 1) && (direction_3 == 0) && ((queue < FL3)||(queue == FL3)) && (floor > FL3)) led_outside_3 = 1;
                 else if ((floor_4_p == 1) && ((queue < FL4)|(queue == FL4)) && (floor > FL4)) led_outside_4 = 1;
                 
                 else if ((floor_0_d == 1) && ((queue < FL0)||(queue == FL0)) && ((floor > FL0))) led_inside_0 = 1;
                 else if ((floor_1_d == 1) && ((queue < FL1)||(queue == FL1)) && ((floor > FL1))) led_inside_1 = 1;
                 else if ((floor_2_d == 1) && ((queue < FL2)||(queue == FL2)) && ((floor > FL2))) led_inside_2 = 1;
                 else if ((floor_3_d == 1) && ((queue < FL3)||(queue == FL3)) && ((floor > FL3))) led_inside_3 = 1;
                 else if ((floor_4_d == 1) && ((queue < FL4)||(queue == FL4)) && ((floor > FL4))) led_inside_4 = 1;
                 
                 else begin end
            end
            
            UP: begin
                 if ((floor_0_p == 1) && ((queue < FL0)|(queue == FL0)) && ((floor > FL0))) led_outside_0 = 1;
                 else if ((floor_1_p == 1) && (direction_1 == 1) && ((queue > FL1)||(queue == FL1)) && (floor < FL1)) led_outside_1 = 1;
                 else if ((floor_2_p == 1) && (direction_2 == 1) && ((queue > FL2)||(queue == FL2)) && (floor < FL2)) led_outside_2 = 1;
                 else if ((floor_3_p == 1) && (direction_3 == 1) && ((queue > FL3)||(queue == FL3)) && (floor < FL3)) led_outside_3 = 1;
                 else if ((floor_4_p == 1) && ((queue < FL0)||(queue == FL0)) && (floor > FL4)) led_inside_0 = 1;
                 
                 else if ((floor_0_d == 1) && ((queue > FL0)||(queue == FL0)) && ((floor < FL0))) led_inside_0 = 1;
                 else if ((floor_1_d == 1) && ((queue > FL1)||(queue == FL1)) && ((floor < FL1))) led_inside_1 = 1;
                 else if ((floor_2_d == 1) && ((queue > FL2)||(queue == FL2)) && ((floor < FL2))) led_inside_2 = 1;
                 else if ((floor_3_d == 1) && ((queue > FL3)||(queue == FL3)) && ((floor < FL3))) led_inside_3 = 1;
                 else if ((floor_4_d == 1) && ((queue > FL4)||(queue == FL4)) && ((floor < FL4))) led_inside_4 = 1;
                 
                 else begin end                           
            end
            
            default: begin
                if (floor_0_p == 1) begin led_outside_0 = 1; queue <= FL0; end else if (floor_4_p == 1) begin led_outside_4 = 1; queue <= FL4; end 
                else if (floor_1_p == 1) begin led_outside_1 = 1; queue <= FL1; end else if (floor_2_p == 1) begin led_outside_2 = 1; queue <= FL2; end
                else if (floor_3_p == 1) begin led_outside_3 = 1; queue <= FL3; end
            
                else if (floor_0_d == 1) begin led_inside_0 = 1; queue <= FL0; end else if (floor_4_d == 1) begin led_inside_4 = 1; queue <= FL4; end 
                else if (floor_1_d == 1) begin led_inside_1 = 1; queue <= FL1; end else if (floor_2_d == 1) begin led_inside_2 = 1; queue <= FL2; end
                else if (floor_3_d == 1) begin led_inside_3 = 1; queue <= FL3; end           
            end
            
        endcase
    end
    
    else
    begin
        if (((led_outside_1)||(led_inside_1)) && (floor == FL1)) begin led_outside_1 = 0; led_inside_1 = 0; end
        else if (((led_outside_2)||(led_inside_2)) && (floor == FL2)) begin led_outside_2 = 0; led_inside_2 = 0; end
        else if (((led_outside_3)||(led_inside_3)) && (floor == FL3)) begin led_outside_3 = 0; led_inside_3 = 0; end
    end
    
end

// Queue Handling
always @(posedge clk_50hz, negedge rst) begin 

    if(~rst) begin
        counter <= 0;
        floor <= FL0;
        led_busy <= 0;
        led_busy_out <= 0;
        end
    
    else if ((led_busy == 1) && (elev_state == DOWN)) begin
   
        if (counter == 12'h0fa) begin
            counter <= 0; floor <= floor - 1; led_busy = 0; led_busy_out = 0;
        end
        
        else begin
            counter <= counter + 1; floor <= floor; led_busy_out = 0;
        end
    end
             
    else if ((led_busy == 1) && (elev_state == UP)) begin
        if (counter == 12'h0fa) begin
            counter <= 0; floor <= floor + 1; led_busy = 0;
        end 
        
        else begin
            counter <= counter + 1; floor <= floor;
        end
    end
                   
    else if (elev_state == UP) begin
         if (counter == 12'h0fa) begin
             if (((led_outside_1)||(led_inside_1)) && (floor == FL1)) begin led_busy = 1; counter <= 0; led_busy_out = 0; end 
             else if (((led_outside_2)||(led_inside_2)) && (floor == FL2)) begin led_busy = 1; counter <= 0; led_busy_out = 0; end 
             else if (((led_outside_3)||(led_inside_3)) && (floor == FL3)) begin led_busy = 1; counter <= 0; led_busy_out = 0; end
             else begin counter <= 0; floor <= floor + 1; end 
             end
                
         else begin
             if (((led_outside_1)||(led_inside_1)) && (floor == FL1)) begin led_busy = 0; counter <= counter + 1; led_busy_out = 1; end 
             else if (((led_outside_2)||(led_inside_2)) && (floor == FL2)) begin led_busy = 0; counter <= counter + 1; led_busy_out = 1; end 
             else if (((led_outside_3)||(led_inside_3)) && (floor == FL3)) begin led_busy = 0; counter <= counter + 1; led_busy_out = 1; end
             else begin
             counter <= counter + 1;
             floor <= floor;
             led_busy_out <= 0;
             end end               
    end
        
    else if (elev_state == DOWN) begin
         if (counter == 12'h0fa) begin 
             if (((led_outside_1)||(led_inside_1)) && (floor == FL1)) begin led_busy = 1; counter <= 0; led_busy_out = 0; end 
             else if (((led_outside_2)||(led_inside_2)) && (floor == FL2)) begin led_busy = 1; counter <= 0; led_busy_out = 0; end 
             else if (((led_outside_3)||(led_inside_3)) && (floor == FL3)) begin led_busy = 1; counter <= 0; led_busy_out = 0; end
             else begin counter <= 0; floor <= floor - 1; end 
             end
                    
             else begin
             if (((led_outside_1)||(led_inside_1)) && (floor == FL1)) begin led_busy = 0; counter <= counter + 1; led_busy_out = 1; end 
             else if (((led_outside_2)||(led_inside_2)) && (floor == FL2)) begin led_busy = 0; counter <= counter + 1; led_busy_out = 1; end 
             else if (((led_outside_3)||(led_inside_3)) && (floor == FL3)) begin led_busy = 0; counter <= counter + 1; led_busy_out = 1; end
             else begin
             counter <= counter + 1;
             floor <= floor;
             led_busy_out <= 0; end
             end              
    end
        
   else begin
        counter <= 0;
        floor <= floor;
        led_busy_out <= 0;
        end       
end

endmodule