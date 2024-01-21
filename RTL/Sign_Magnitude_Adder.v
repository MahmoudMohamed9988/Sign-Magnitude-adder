/*  the operation of sign magnitude is summarized as : 
        1- if the two operands have the same sign, add the magnitude and keep the sign
        2- if the two operands have diff. sign, subtract the smaller mag. from biggest one,
               and keep the sign of the biggest one. */ 





module sign_mag_adder #(parameter N = 4)(input [N-1:0] a , b , output reg [N-1 : 0] sum);

reg  a_sign , b_sign;
reg [N-2 : 0] a_mag , b_mag , max , min;
reg [N-2 : 0] sum_mag;
reg sign;
always @(*) begin
a_sign = a[N-1];
b_sign = b[N-1];
a_mag = a[N-2:0];
b_mag = b[N-2:0];

       if (a_mag > b_mag ) begin
                  max = a_mag;
                 min = b_mag;
                 sign = a_sign;
             end
        else begin 
                 max = b_mag;
                 min = a_mag;
                 sign = b_sign;
             end
       //  add/sum magnitude ----------------------
         if (a_sign == b_sign )
                     sum_mag = max + min ;
         else 
                     sum_mag = max - min ;
       //-------------------------------------------

// get the signed output 
sum = {sign , sum_mag};

end









endmodule
