module delay2s (
    input wire iclock,
    input wire idata,
    output reg odata
);

    // we will delay input data for every 2 second
    // we know that the clock is 100 Mhz therefore
    // 1/10^6 = 10 ns
    // 10 ns per one cycle
    // how many cycle in one second?
    // 1sec = 10^9 ns 
    // 10^8 cycle
    // 2*10^8 cycle or 200 000 000
    // we will store this value in a constant 
    localparam integer STOPCOUNTER=200000000;
    reg [27:0] rcounter = 0; // 2^28 =268435456 cover 200000000
    reg r_data_prev = 0;


    always @(posedge iclock) begin
        if(rcounter < STOPCOUNTER-1) begin 
            rcounter <= rcounter + 1;
        end else begin
            // we need to shift idata as well
            rcounter <= 0;
            r_data_prev <= idata;
            odata <= r_data_prev;
        end
    end
endmodule