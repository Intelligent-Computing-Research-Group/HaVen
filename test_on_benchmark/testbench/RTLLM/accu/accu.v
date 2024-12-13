`timescale 1ns / 1ps
module accu (p, rdy, clk, reset, a, b);
   input clk, reset;
   input [7:0] a, b;
   output [15:0] p;
   output rdy;

   reg [15:0] p;
   reg [15:0] multiplicand;
   reg [15:0] multiplier;
   reg [4:0] ctr;
   reg rdy;

   always @(posedge clk or posedge reset) begin
      if (reset) begin
         multiplier <= {8'b0, a};
         multiplicand <= {8'b0, b};
         ctr <= 5'b0;
         p <= 16'b0;
         rdy <= 1'b0;
      end else begin
         if (ctr < 5'd16) begin
            multiplicand <= {multiplicand[14:0], 1'b0};
            if (multiplier[ctr])
               p <= p + multiplicand;
            ctr <= ctr + 1;
         end else begin
            rdy <= 1'b1;
         end
      end
   end
endmodule
