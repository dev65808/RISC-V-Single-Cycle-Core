module Core_datapath( clk,reset,ra1,ra2,pcsrc,wa,we,instr,immsrc,result,alucontrol,alusrc,readdata,pc,rd1,rd2

    );
    input clk,reset,pcsrc,wa,we,alusrc;
    input [1:0] immsrc;
    input [3:0] alucontrol;
    input [31:0] instr,readdata;
    input  [4:0] ra1,ra2;
    output [32:0] result;
    output[31:0] pc,rd1,rd2;
    
    
    pc_ff uut1(.pc(pc), .pcnext(pcnext), .clk(clk), .reset(reset));
    pc_plus_4 uut2(.pcplus4(pcplus4), .pc(pc));
    pc_target uut3(.pc(pc), .immext(immnext), .pctarget(pctarget));
    pc_mux uut4(.pc_next(pc_next), .pcsrc(pcsrc), .pc_plus_4(pc_plus_4), .pc_target(pc_target));
    reg_mem1 uut5(.ra1(ra1), .ra2(ra2),.wa(wa), .rd1(rd1), .rd2(rd2), .clk(clk), .wd(wd), .we(we));
    extend uut6(.immsrc(immsrc), .immext(immnext), .instr(instr));
    alu_s uut7(.result(result), .carry(carry), .overflow(overflow), .zero(zero), .negative(negative), .alucontrol(alucontrol), .i0(i0), .i1(i1));
    alu_mux uut8(.alusrc(alusrc), .b(b), .wd(wd), .immext(immext));
    result_mux uut9(.result(wd), .aluresult(result),.readdata(readdata), .pc_plus_4(pc_plus_4));
endmodule
