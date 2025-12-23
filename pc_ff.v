module pc_ff(pc,pcnext,clk);
parameter N=32;
output reg[N-1:0]pc;
input [N-1:0]pcnext;
input clk;
always @(posedge clk)
begin
	pc=pcnext;
end
endmodule
