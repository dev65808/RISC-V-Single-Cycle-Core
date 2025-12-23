module Single_cycle_core_top( clk,reset,result

    );
    
    input clk;
    input reset;
    output  [32:0] result;
    wire memwrite;
    wire [31:0] pc,rd1,rd2;
    wire [32:0] data;
    wire [4:0] ra1,ra2;
    reg [31:0] a;
    wire branch,jump;
    single_cycle_core ut01(.result(result),.clk(clk), .reset(reset), .ra1(data[19:15]), .ra2(data[24:20]), .instr(data),
                            .readdata(rd), .rd2(rd2), .rd1(rd1), .op(data[6:0]),
                            .opb5(data[5]),.funct3(data[9:7]),.funct7b5(data[30]),.memwrite(memewrite),
                            .wa(data[11:7]),.branch(branch), .jump(jump),.pc(pc));
    data_mem ut02(.rd(rd),.we(memwrite),.clk(clk),.wd(rd2), .a(result));
    inst_mem ut03(.address(pc), .data(data)); 
    
endmodule
