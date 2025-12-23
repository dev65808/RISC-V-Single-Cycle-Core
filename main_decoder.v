module main_decoder(regwrite,immsrc,alusrc,memwrite,resultsrc,branch,aluop,jump,op);
output reg regwrite,alusrc,memwrite,branch,jump;
output reg [1:0]immsrc,resultsrc,aluop;
input [6:0]op;
always @(*)
begin
	case (op)
    7'b0000000: begin//pc source=branch&zerofl|jump
        regwrite  = 1'b0;
        immsrc    = 2'b00;
        alusrc    = 1'b0;
        memwrite  = 1'b0;
        resultsrc = 2'b00;
        branch    = 1'b0;
        aluop     = 2'b00;
        jump      = 1'b0;
    end
    7'b0000011: begin    //lw
        regwrite  = 1'b1;
        immsrc    = 2'b00;
        alusrc    = 1'b1;
        memwrite  = 1'b0;
        resultsrc = 2'b01;
        branch    = 1'b0;
        aluop     = 2'b00;
        jump      = 1'b0;
    end
    7'b0100011: begin
        regwrite  = 1'b0;
        immsrc    = 2'b01;
        alusrc    = 1'b1;
        memwrite  = 1'b1;
        resultsrc = 2'b00;
        branch    = 1'b0;
        aluop     = 2'b00;
        jump      = 1'b0;
    end
    7'b0110011: begin
        regwrite  = 1'b1;
        immsrc    = 2'bxx;  // Don't care for R-type
        alusrc    = 1'b0;
        memwrite  = 1'b0;
        resultsrc = 2'b00;
        branch    = 1'b0;
        aluop     = 2'b10;
        jump      = 1'b0;
    end
    7'b0010011: begin
        regwrite  = 1'b1;
        immsrc    = 2'b00;
        alusrc    = 1'b1;
        memwrite  = 1'b0;
        resultsrc = 2'b00;
        branch    = 1'b0;
        aluop     = 2'b10;
        jump      = 1'b0;
    end
    7'b1100011: begin
        regwrite  = 1'b0;
        immsrc    = 2'b10;
        alusrc    = 1'b0;
        memwrite  = 1'b0;
        resultsrc = 2'b00;
        branch    = 1'b1;
        aluop     = 2'b01;
        jump      = 1'b0;
    end
    7'b1101111: begin
        regwrite  = 1'b1;
        immsrc    = 2'b11;
        alusrc    = 1'b1;
        memwrite  = 1'b0;
        resultsrc = 2'b10;
        branch    = 1'b0;
        aluop     = 2'b00;
        jump      = 1'b1;
    end
    7'b1100111: begin
        regwrite  = 1'b1;
        immsrc    = 2'b00;
        alusrc    = 1'b1;
        memwrite  = 1'b0;
        resultsrc = 2'b10;
        branch    = 1'b0;
        aluop     = 2'b00;
        jump      = 1'b1;
    end
    default: begin
        regwrite  = 1'b0;
        immsrc    = 2'b00;
        alusrc    = 1'b0;
        memwrite  = 1'b0;
        resultsrc = 2'b00;
        branch    = 1'b0;
        aluop     = 2'b00;
        jump      = 1'b0;
    end
endcase
end
endmodule
		
