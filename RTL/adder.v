// The most basic component in the adder is called a half adder.
// This circuit computes the sum and carry out on two input arguments. 
//The reason it is called a half adder instead of a full adder is because ...
// it does not accommodate a "carry in" during the computation,

module full_adder #( parameter N = 4 )(input [N-1:0] a , b ,input cin ,output reg cout, reg [N-1 : 0] sum);

reg [N:0] S ;
//-------------------------------------
always @(*) begin
S[0] = cin; 
cout = S[N]; 
end
//--------------------------------------
//------------generate---block----------
generate
genvar i;
for ( i = 0 ; i < N ; i = i +1) begin
full_adder_1_bit add_1 ( a[i] , b[i], S[i] , S[i+1] , sum[i] );
end
endgenerate
//---------------------------------------

endmodule



module full_adder_1_bit (input  a , b ,input cin ,output reg cout, reg sum);
reg  sum_temp;

always @(*)begin
sum_temp = a ^ b ;
sum = sum_temp ^ cin;
cout = (a & b) | (( sum_temp & cin) ) ;
end


endmodule
