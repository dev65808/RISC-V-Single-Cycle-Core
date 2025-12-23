module data_mem(rd,a,wd,we,clk);
output  [31:0]rd;
input [31:0]a,wd;
input we,clk;

reg[31:0] rom[63:0];
assign rd=rom[a[31:2]];
always @(posedge clk or posedge a)
begin
	if(we)
		rom[a[31:2]]<=wd;
end
endmodule	
