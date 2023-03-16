`timescale 1ns / 1ps

module Lab3Sim1;

    reg [3:0] a;
    reg [3:0] b;
    
    wire [3:0] t_one;
    wire [3:0] t_two;
    wire [2:0] c;
    
    four_bit_compare test(
        .A(a),
        .B(b),
        .T_one(t_one),
        .T_two(t_two),
        .C(c)
    );           
    initial begin
        a=4'b0000;
        b=4'b0000;
        #10;
        a=4'b1111;
        b=4'b0000;
        #10;
        a=4'b1111;
        b=4'b1110;
        #10;
        a=4'b0010;
        b=4'b1110;
        #10;
        a=4'b1010;
        b=4'b1000;
    end
endmodule