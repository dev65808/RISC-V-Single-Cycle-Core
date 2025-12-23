module result_mux(result,aluresult,readdata,pc_plus_4,resultsrc);
parameter N=32;
output [N-1:0]result;
input [N-1:0]aluresult;
input [N-1:0]readdata;
input [N-1:0]pc_plus_4;
input [1:0]resultsrc;
assign result=resultsrc[1]?pc_plus_4:(result[0]?readdata:aluresult);
endmodule
