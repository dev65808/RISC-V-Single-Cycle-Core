module alu_mux(b,wd,immext,alusrc);
parameter N=32;
output [N-1:0]b;
input [N-1:0]wd;
input [N-1:0]immext;
input alusrc;
assign b=alusrc?immext:wd;
endmodule;
