`timescale 1ns / 1ps //`timescale <time_unit> / <time_precision>

module delay_2clock_tb;

    reg t_clock;
    reg t_idata;
    wire t_odata;

    delay_2clock dut (
        .iclock(t_clock),
        .idata(t_idata),
        .odata(t_odata)
    );

    initial begin
        t_clock = 0;
        forever #5 t_clock = ~t_clock; // 10 ns period include 5ns ON 
        // 5ns OFF => 100MHz,
    end

    initial begin
        // initialize input data
        t_idata = 0;
        #12; // after 12ns
        t_idata = 1;
        #10; // after 10ns
        t_idata = 0;
        #20; // after 20ns
        t_idata = 1;
        #15; // after 15ns
        t_idata = 0;
        #30; // after 30ns
        t_idata = 1;
        #10; // after 10ns
        t_idata = 0;
        #50; // after 50ns
        $finish;
    end

endmodule
