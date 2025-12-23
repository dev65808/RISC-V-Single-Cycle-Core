module pc_mux(pc_next,pc_target,pc_plus_4,pcsrc);
parameter N=32;
output[N-1:0]pc_next;
input [N-1:0]pc_plus_4;
input[N-1:0]pc_target;
input pcsrc;
assign pc_next=(pcsrc==1)?pc_target:pc_plus_4;
endmodule
