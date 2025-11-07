`timescale 1ns / 1ps

module toggle_LED_tb();

    // Testbench signals
    reg i_Clk = 0;
    reg i_Switch_1 = 1;
    wire o_LED_1;

    // Instantiate your DUT (Device Under Test)
    toggle_LED dut (
        .i_Clk(i_Clk),
        .i_Switch_1(i_Switch_1),
        .o_LED_1(o_LED_1)
    );

    // Clock generation: 100 MHz -> period = 10 ns
    always #5 i_Clk = ~i_Clk;  // toggles every 5 ns (half-period)

    // Stimulus (manual testing)
    initial begin
        // Initial state
        i_Switch_1 = 1; // switch unpressed (high)
        #50;            // wait 50 ns

        // Press the switch
        i_Switch_1 = 0;
        #20;

        // Release the switch
        i_Switch_1 = 1;
        #20;

        // Press and release again
        i_Switch_1 = 0;
        #20;
        i_Switch_1 = 1;
        #20;

        // Stop simulation
        #200;
        $finish;
    end

endmodule
