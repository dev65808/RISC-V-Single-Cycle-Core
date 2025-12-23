module reg_mem1(rd1,rd2,ra1,ra2,wa,wd,we,clk);
output [31:0]rd1,rd2;
input [31:0]wd;
input[4:0]ra1,ra2,wa;
input we,clk;
integer i;
reg [31:0] REGF[31:0];
assign rd1=REGF[ra1];
assign rd2=REGF[ra2];
always @(posedge clk)
begin
	if(we)
		REGF[wa]<=wd;
end
initial 
begin
	for(i=0;i<=31;i=i+1)
		REGF[i]=32'd0;
end
endmodule
