module pc_target(pctarget,pc,immext);
parameter N=32;
output [N-1:0]pctarget;
input [N-1:0]pc;
input [N-1:0]immext;
assign pctarget=pc+immext;
endmodule
