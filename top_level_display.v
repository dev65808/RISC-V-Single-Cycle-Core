module top_level_display(
    input clk_100mhz,
    input reset,
    output [3:0] Anode_Activate,
    output [6:0] LED_out
);

    wire [31:0] result;

    // Instantiate your core
    Single_cycle_core_top cpu_core (
        .clk(clk_100mhz),
        .reset(reset),
        .result(result)
    );

seven_seg display_inst (
    .clk_100mhz(clk),
    .reset(reset),
    .value(result[15:0]),
    .Anode_Activate(Anode_Activate),
    .LED_out(LED_out)
);


endmodule
