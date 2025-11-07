`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2025 07:43:06 PM
// Design Name: 
// Module Name: toggle_LED
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module toggle_LED(
    input  wire i_Clk,
    input  wire i_Switch_1,
    output wire o_LED_1
);
    reg r_LED_1    = 1'b0;
    reg r_Switch_1 = 1'b0;

    always @(posedge i_Clk) begin
        if (i_Switch_1 == 1'b0 && r_Switch_1 == 1'b1)
            r_LED_1 <= ~r_LED_1;
        r_Switch_1 <= i_Switch_1;
    end

    assign o_LED_1 = r_LED_1;
endmodule
