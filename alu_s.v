module alu_s (result,overflow,carry,zero,negative, alucontrol, i0, i1);
    parameter N = 32;

    output reg [N:0] result;        // N-bit output to include carry/borrow
    output reg carry;
    output wire overflow,zero,negative;
    input signed [N-1:0] i0, i1;      //  input declaration
    input [3:0]alucontrol;

    reg [N-1:0] res;
    wire [N-1:0]temp;
    reg slt,sltu;
    assign temp= alucontrol[0]?(~i1+1):i1;

    always @(*) begin
        case (alucontrol)
            4'd0: {carry, res} = i0 + temp;        // ADD
            4'd1: {carry, res} = i0 +temp;        // SUB
            4'd2: res = i0 & i1;                // AND
            4'd3: res = i0 | i1;                // OR
            4'd4: res = i0 ^ i1;                // XOR
            4'd5: begin
			slt = (i0[31] == i1[31])?(i0 < i1) : i0[31];             // slt
			res={N-1'b0,slt};
		  end
            4'd6: begin
			sltu = $unsigned(i0) < $unsigned(i1);                    // sltu
			res = {N-1'b0,sltu};
		  end
	    4'd7: res={i0[N-1:12],12'b0};        //last12 bits set to 0
	    4'd8: res=i0+{i1[N-1:12],12'b0};     // a+b but last12bit set to zero
	    4'd9: res={i1[N-1:12],12'b0};        // last 12bits of b is 0
            4'd10: res = i0 << i1;                // Shift a left by b
	    4'd11: res = i0>>>i1;                //arithmatic shift of a by b
            4'd12: res = i0 >> i1;                // Shift right
            default: res = {N{1'bz}};             // High impedance
        endcase

        if (alucontrol == 4'd0 ||alucontrol == 4'd1)
            result = {carry, res};
        else
            result =  res;
    end
	assign zero=(result==0)?1:0;
	assign negative=(result[N-1])?1:0;
	assign overflow=(~(i0[N-1]^i1[N-1])&(i0[N-1]^result[N]))|((i0[N-1]^i1[N-1])&(i0[N-1]^result[N]));
endmodule
