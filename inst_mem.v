module inst_mem (data,address);
input [31:0]address;
output reg [31:0]data;
 reg [31:0] rom[0:79];
initial begin
       // Initialize x1 = 0, x2 = 1
    rom[0] = 32'h00000093; // addi x1, x0, 0
    rom[1] = 32'h00100113; // addi x2, x0, 1

    // Store first two numbers to memory 0(x0) and 4(x0)
    rom[2] = 32'h00102023; // sw x1, 0(x0) = 0
    rom[3] = 32'h00202223; // sw x2, 4(x0) = 1

    // Generate Fibonacci numbers (fully unrolled, storing each result to memory)
    rom[4]  = 32'h002081B3; // add x3, x1, x2 => 0+1=1
    rom[5]  = 32'h00302423; // sw x3, 8(x0) => 1
    rom[6]  = 32'h002000B3; // add x1, x0, x2 => x1=1
    rom[7]  = 32'h00300133; // add x2, x0, x3 => x2=1

    rom[8]  = 32'h002081B3; // add x3, x1, x2 => 1+1=2
    rom[9]  = 32'h00302623; // sw x3, 12(x0) => 2
    rom[10] = 32'h002000B3; // add x1, x0, x2 => x1=1
    rom[11] = 32'h00300133; // add x2, x0, x3 => x2=2

    rom[12] = 32'h002081B3; // add x3, x1, x2 => 1+2=3
    rom[13] = 32'h00302823; // sw x3, 16(x0) => 3
    rom[14] = 32'h002000B3; // add x1, x0, x2 => x1=2
    rom[15] = 32'h00300133; // add x2, x0, x3 => x2=3

    rom[16] = 32'h002081B3; // add x3, x1, x2 => 2+3=5
    rom[17] = 32'h00302A23; // sw x3, 20(x0) => 5
    rom[18] = 32'h002000B3; // add x1, x0, x2 => x1=3
    rom[19] = 32'h00300133; // add x2, x0, x3 => x2=5

    rom[20] = 32'h002081B3; // add x3, x1, x2 => 3+5=8
    rom[21] = 32'h00302C23; // sw x3, 24(x0) => 8
    rom[22] = 32'h002000B3; // add x1, x0, x2 => x1=5
    rom[23] = 32'h00300133; // add x2, x0, x3 => x2=8

    rom[24] = 32'h002081B3; // add x3, x1, x2 => 5+8=13
    rom[25] = 32'h00302E23; // sw x3, 28(x0) => 13
    rom[26] = 32'h002000B3; // add x1, x0, x2 => x1=8
    rom[27] = 32'h00300133; // add x2, x0, x3 => x2=13

    rom[28] = 32'h002081B3; // add x3, x1, x2 => 8+13=21
    rom[29] = 32'h003020A3; // sw x3, 32(x0) => 21
    rom[30] = 32'h002000B3; // add x1, x0, x2 => x1=13
    rom[31] = 32'h00300133; // add x2, x0, x3 => x2=21

    rom[32] = 32'h002081B3; // add x3, x1, x2 => 13+21=34
    rom[33] = 32'h003022A3; // sw x3, 36(x0) => 34
    rom[34] = 32'h002000B3; // add x1, x0, x2 => x1=21
    rom[35] = 32'h00300133; // add x2, x0, x3 => x2=34

    rom[36] = 32'h002081B3; // add x3, x1, x2 => 21+34=55
    rom[37] = 32'h003024A3; // sw x3, 40(x0) => 55
    rom[38] = 32'h002000B3; // add x1, x0, x2 => x1=34
    rom[39] = 32'h00300133; // add x2, x0, x3 => x2=55

    rom[40] = 32'h002081B3; // add x3, x1, x2 => 34+55=89
    rom[41] = 32'h003026A3; // sw x3, 44(x0) => 89
    rom[42] = 32'h002000B3; // add x1, x0, x2 => x1=55
    rom[43] = 32'h00300133; // add x2, x0, x3 => x2=89

    rom[44] = 32'h002081B3; // add x3, x1, x2 => 55+89=144
    rom[45] = 32'h003028A3; // sw x3, 48(x0) => 144
    rom[46] = 32'h002000B3; // add x1, x0, x2 => x1=89
    rom[47] = 32'h00300133; // add x2, x0, x3 => x2=144

    rom[48] = 32'h002081B3; // add x3, x1, x2 => 89+144=233
    rom[49] = 32'h00302AA3; // sw x3, 52(x0) => 233
    rom[50] = 32'h002000B3; // add x1, x0, x2 => x1=144
    rom[51] = 32'h00300133; // add x2, x0, x3 => x2=233

    rom[52] = 32'h002081B3; // add x3, x1, x2 => 144+233=377
    rom[53] = 32'h00302CA3; // sw x3, 56(x0) => 377
    rom[54] = 32'h002000B3; // add x1, x0, x2 => x1=233
    rom[55] = 32'h00300133; // add x2, x0, x3 => x2=377

    rom[56] = 32'h002081B3; // add x3, x1, x2 => 233+377=610
    rom[57] = 32'h00302EA3; // sw x3, 60(x0) => 610
    rom[58] = 32'h002000B3; // add x1, x0, x2 => x1=377
    rom[59] = 32'h00300133; // add x2, x0, x3 => x2=610

    rom[60] = 32'h002081B3; // add x3, x1, x2 => 377+610=987
    rom[61] = 32'h00302023; // sw x3, 64(x0) => 987
    rom[62] = 32'h002000B3; // add x1, x0, x2 => x1=610
    rom[63] = 32'h00300133; // add x2, x0, x3 => x2=987

    rom[64] = 32'h002081B3; // add x3, x1, x2 => 610+987=1597
    rom[65] = 32'h00302223; // sw x3, 68(x0) => 1597
    rom[66] = 32'h002000B3; // add x1, x0, x2 => x1=987
    rom[67] = 32'h00300133; // add x2, x0, x3 => x2=1597

    rom[68] = 32'h002081B3; // add x3, x1, x2 => 987+1597=2584
    rom[69] = 32'h00302423; // sw x3, 72(x0) => 2584
    rom[70] = 32'h002000B3; // add x1, x0, x2 => x1=1597
    rom[71] = 32'h00300133; // add x2, x0, x3 => x2=2584

    rom[72] = 32'h002081B3; // add x3, x1, x2 => 1597+2584=4181
    rom[73] = 32'h00302623; // sw x3, 76(x0) => 4181
    rom[74] = 32'h002000B3; // add x1, x0, x2 => x1=2584
    rom[75] = 32'h00300133; // add x2, x0, x3 => x2=4181
    
    rom[76] = 32'h002081B3; // add x3, x1, x2 => 2584+4181=6765
    rom[77] = 32'h00302423; // sw x3, 80(x0) => 6765
    rom[78] = 32'h00000093; // addi x1, x0, 0
    rom[79] = 32'h00100113; // addi x2, x0, 1
    rom[80] = 32'hEC1FF0EF; // jal x0, -320 (go back to rom[0])
        end
always @(*)
	begin
		data=rom[address[31:2]];
	end
endmodule
