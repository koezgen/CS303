module four_bit_compare
(
    output reg [2:0] C,
    input [3:0] A,
    input [3:0] B
);

    reg [3:0] T_one;
    reg [3:0] T_two;

always @*//(A[3:0] or B[3:0])
    begin
        if ((A[3] == 1) && (B[3] == 0))
            begin
               C[0] = 0;
               C[1] = 1;
               C[2] = 0;
            end
        if ((A[3] == 0) && (B[3] == 1))
            begin
               C[0] = 1;
               C[1] = 0;
               C[2] = 0;
            end
        if ((B[3] == 1) && (A[3] == 1))
            begin
               T_one[3:0] = (~A[3:0] + 1'b1);
               T_two[3:0] = (~B[3:0] + 1'b1);
               C[0]= T_one < T_two;
               C[1]= T_one > T_two;
               C[2]= (T_one == T_two);
            end
        if((B[3] == 0) && (A[3] == 0))
            begin
               T_one[3:0] = A[3:0];
               T_two[3:0] = B[3:0];
               C[0]= T_one > T_two;
               C[1]= T_one < T_two;
               C[2]= (T_one == T_two);
            end
    end 
endmodule