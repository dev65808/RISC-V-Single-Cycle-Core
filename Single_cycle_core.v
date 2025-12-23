module single_cycle_core(clk,reset,ra1,ra2,wa,instr,result,readdata,memwrite,branch,jump,op,funct3,
                            funct7b5,result,opb5,pc,rd1,rd2

    );
    input clk,reset,wa;
    wire we;
    wire regwrite;
    input [31:0] instr,readdata;
    input  [4:0] ra1,ra2;
    output [32:0] result;
    output wire memwrite,branch,jump;
    input [6:0]op;
    input [2:0] funct3;
    input funct7b5;
    input opb5;
    output [31:0] pc,rd1,rd2;
    wire pcsrc,alusrc;
    wire [3:0] ALUControl;
    wire [1:0]immsrc;
    //wire zero;
    
    Core_datapath uut01(.clk(clk), .ra1(ra1), .ra2(ra2),.pcsrc(pcsrc),.rd1(rd1), .rd2(rd2),
                       .wa(wa), .we(we), .instr(instr), .immsrc(immsrc), .result(result),
                       .alucontrol(ALUControl), .alusrc(alusrc),.readdata(readdata),.reset(reset), .pc(pc));
    Control_unit uut02(.regwrite(we),.immsrc(immsrc),.alusrc(alusrc),.memwrite(memwrite),
                          .resultsrc(resultsrc),.branch(branch),.jump(jump),.op(op),.funct3(funct3),
                          .funct7b5(funct7b5),.opb5(opb5), .ALUControl(ALUControl),.pcsrc(pcsrc));
endmodule
