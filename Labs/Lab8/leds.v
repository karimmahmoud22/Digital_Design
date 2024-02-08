module leds ( 
// This module contains:
// clk divider: to decrease the clk frequency of FPGA to control the speed of LEDS blinking
//                     to can see it
// counter: to determine the LEDS blinking pattern depending on the value inside it
    input  wire CLK,
    output reg  LED1,
    output reg  LED2,
    output reg  LED3,
    output reg  LED4,
    output reg  LED5
);
// The value that the clk frequency of the FPGA is divided by
localparam CLK_DIV = 12000000; // To make the delay between steps in pattern 1 sec
// LEDS counter
reg [1:0] counter = 0;
// clk divider counter
reg [23:0] div_counter = 0;
// clk divider and counter part
always@ (posedge CLK) begin
    if (div_counter == CLK_DIV)
    begin
        counter <= counter + 1;
        div_counter <= 0;
    end
    else
    begin
        div_counter <= div_counter + 1;
    end
end
// LEDS blinking pattern depending on the value in LEDS counter
always@ (*) begin
    case(counter)
    2'b01: begin LED5 = 1; end
    2'b10: begin LED5 = 1; LED1 = 1; LED3 = 1; end
    2'b11: begin LED1 = 1; LED2 = 1; LED3 = 1; LED4 = 1; LED5 = 1; end
    default: begin LED1 = 0; LED2 = 0; LED3 = 0; LED4 = 0; LED5 = 0; end
    endcase
end
endmodule
