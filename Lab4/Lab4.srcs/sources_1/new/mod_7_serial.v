`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2022 10:07:00
// Design Name: 
// Module Name: mod_7_serial
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

module clockcounter(
  output cnt_out,
  output reg led,
  //output reg [31:0] count,
  //output reg [31:0] max_count,
  input clk,
  input reset,
  input enable,
  input [2:0] configure
);

reg [31:0] max_count;
reg [31:0] count = 32'h00000000;
// for simulation purposes, suggested values will be used.
// for implementation, appropriate values will be adopted.
always @(posedge clk) 
    begin
        case (configure)
            3'b111: max_count <= 32'hFFFFFFFF;
            //FFFFFFFF
            3'b110: max_count <= 32'h80000000;
            //80000000
            3'b101: max_count <= 32'h40000000;
            //00004000
            3'b100: max_count <= 32'h20000000;
            //00030973
            3'b011: max_count <= 32'h10000000;
            //10000000
            3'b010: max_count <= 32'h08000000;
            //08000000
            3'b001: max_count <= 32'h04000000;
            //04000000
            3'b000: max_count <= 32'h02000000;
            //02000000
        endcase
    end
    
assign cnt_out = (count == max_count);


//assign led = cnt_out;

always @(posedge cnt_out, posedge reset)
begin
    if (reset == 1)
    begin
        led <= 0;
    end
    else
    begin
        led <= 1;
        if (led == 1)
        led <= 0;
    end
end

// negedge cnt ve else if cnt kaldýr
always @(posedge clk, posedge reset, negedge cnt_out)
begin
    if (reset) 
    begin
        count <= 32'h00000000;
    end
    else if (cnt_out) count <= 32'h00000000;
    else if (enable) count <= count + 1'b1;
    else begin
    count <= count; end
end

//always @(negedge cnt_out)
//begin
//    count <= 32'b00000000;
//end
//always @(posedge clk, posedge reset)
//begin
//    case ({enable, reset})
//        2'b00: count <= count;
//        2'b01: count <= 0;
//        2'b10: count <= count + 1;
//        2'b11: count <= 0;
//    endcase
//end

//always @(posedge clk)
//begin
//    if (count == max_count)
//    begin
//        cnt_out <= 1;
//        #10 cnt_out <= 0;
//        led <= 1;
//        #10 led <= 0;
//        count <= 0;
//    end
//end
//always @(posedge clk or negedge reset) 
//begin
//    if (enable)
//    begin
//        count <= count + 1;
//        if (count == max_count)
//        begin
//            cnt_out <= 1;
//            #1
//            cnt_out <= 0;
//            led <= ~led;
//            #1
//            led <= ~led;
//            count <= 0;
//        end
//        if (reset)
//        begin
//            count <= 0;
//        end
//    end
//    else if (reset)
//    begin
//        count <= 0;
//    end
//    else
//    begin
//        count <= count;
//    end
//end
//endmodule
endmodule

module mod_7_circuit(
    output reg [2:0] out,
    input cnt_out,
    input reset,
    input enable,
    input serial_in
);

reg [1:0] state = 2'b00;
//reg [2:0] state_mod = 3'b000;

//bu state machine inputlari mod x'lere tasiyacak 
//outputlarý yaratiyor.
always @(posedge cnt_out, posedge reset)
begin
    if (reset == 1)
    begin
        state <= 2'b00;
    end
    else
    begin
    case (state)
        2'b00: begin state <= 2'b01; end
        2'b01: begin state <= 2'b10; end
        2'b10: begin state <= 2'b00; end
        2'b11: begin state <= 2'b00; end
        default : begin state <= 2'b00; end
    endcase
    end
end
// 2nd state machine
always @(posedge cnt_out, posedge reset)
    if (reset == 1)
    begin
        out <= 3'b000;
    end
    else
    begin
        case (out)
            3'b000:
                if (serial_in == 1)
                begin
                    case (state)
                        2'b00: begin out <= 3'b001; end
                        2'b01: begin out <= 3'b010; end
                        2'b10: begin out <= 3'b100; end
                    endcase
                end
                else
                begin
                    out <= out;
                end
            3'b001:
                if (serial_in == 1)
                begin
                    case (state)
                        2'b00: begin out <= 3'b010; end
                        2'b01: begin out <= 3'b011; end
                        2'b10: begin out <= 3'b101; end
                    endcase
                end
                else
                begin
                    out <= out;
                end
            3'b010:
                if (serial_in == 1)
                begin
                    case (state)
                        2'b00: begin out <= 3'b011; end
                        2'b01: begin out <= 3'b100; end
                        2'b10: begin out <= 3'b110; end
                    endcase
                end
                else
                begin
                    out <= out;
                end
            3'b011:
                if (serial_in == 1)
                begin
                    case (state)
                        2'b00: begin out <= 3'b100; end
                        2'b01: begin out <= 3'b101; end
                        2'b10: begin out <= 3'b000; end
                    endcase
                end
                else
                begin
                    out <= out;
                end
            3'b100:
                if (serial_in == 1)
                begin
                    case (state)
                        2'b00: begin out <= 3'b101; end
                        2'b01: begin out <= 3'b110; end
                        2'b10: begin out <= 3'b001; end
                    endcase
                end
                else
                begin
                    out <= out;
                end
            3'b101:
                if (serial_in == 1)
                begin
                    case (state)
                        2'b00: begin out <= 3'b110; end
                        2'b01: begin out <= 3'b000; end
                        2'b10: begin out <= 3'b001; end
                    endcase
                end
                else
                begin
                    out <= out;
                end
            3'b110:
                 if (serial_in == 1)
                 begin
                    case (state)
                        2'b00: begin out <= 3'b000; end
                        2'b01: begin out <= 3'b001; end
                        2'b10: begin out <= 3'b011; end
                    endcase
                 end
                 else
                 begin
                    out <= out;
                 end
        endcase
    end
endmodule

module main(
    output wire [2:0] out,
    output wire led,
    input reset,
    input enable,
    input serial_in,
    input clk,
    input [2:0] configure
);

wire part2_out;

    clockcounter part2(.cnt_out(part2_out), .led(led), .clk(clk), .reset(reset), .enable(enable), .configure(configure [2:0]));
    mod_7_circuit part1(.out(out [2:0]), .cnt_out(part2_out), .reset(reset), .enable(enable), .serial_in(serial_in));

endmodule