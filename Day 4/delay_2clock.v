module delay_2clock (
    input wire iclock,
    input wire idata, 
    output wire odata
);
    // we will just delay for 2 clock cycles
    // this is based on a shift register concept from
    // getting started with FPGA book from Russel Merrick
    reg [2:0] rshift;
    always @(posedge iclock) begin
        // rshift first store the data in least significant bit
        // we assign the register to idata
        // since we use sequential, we will use <= non-blocking assignment
        // for every raising edge clock,
        // values in registers [1] and [0]
        // will be moved to [2] and [1] respectively
        rshift[2] <= rshift[1];
        rshift[1] <= rshift[0];
        rshift[0] <= idata;
    end
    
    assign odata = rshift[2];

endmoduleA