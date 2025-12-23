module Control_unit(regwrite,immsrc,alusrc,memwrite,
                    resultsrc,branch,jump,op,funct3,funct7b5,
                              opb5,ALUControl,pcsrc

    );
    output wire regwrite,alusrc,memwrite,branch,jump;
    output wire [1:0]immsrc,resultsrc;
    input [6:0]op;
    input [2:0] funct3;
    input funct7b5;
    input opb5;
    output wire [3:0] ALUControl;
    output pcsrc;
    wire [1:0] aluop;
    main_decoder uut01(.regwrite(regwrite), .immsrc(immsrc), .alusrc(alusrc), .memwrite(memwrite), .resultsrc(resultsrc),
                             .aluop(aluop), .jump(jump), .op(op));
    aludecoder uut02(.ALUOp(aluop), .funct3(funct3), .funct7b5(funct7b5), .opb5(opb5), .ALUControl(ALUControl));
endmodule
