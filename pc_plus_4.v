module pc_plus_4(pcplus4,pc);
parameter N=32;
output [N-1:0]pcplus4;
input [N-1:0]pc;
assign pcplus4=pc+32'd4;
endmodule
