module test;
   reg [0:0] inA, inB, carryIn;
   wire [0:0] out, carryOut;
   initial begin
      $dumpfile("simfulladd.vcd");
      $dumpvars;
      $monitor ("%t  %b + %b + %b = %b %b", $time, inA, inB, carryIn, carryOut, out);
          inA <= 0; inB <= 0; carryIn <= 0;
      #40 inA <= 0; inB <= 0; carryIn <= 1;
      #40 inA <= 0; inB <= 1; carryIn <= 0;
      #40 inA <= 1; inB <= 0; carryIn <= 0;
      #40 inA <= 0; inB <= 1; carryIn <= 1;
      #40 inA <= 1; inB <= 0; carryIn <= 1;
      #40 inA <= 1; inB <= 1; carryIn <= 0;
      #40 inA <= 1; inB <= 1; carryIn <= 1;
      #40 $finish;
   end
   FullAdderFunction adder(inA, inB, carryIn, carryOut, out);
endmodule

module FullAdderFunction(inA, inB, carryIn, carryOut, out);
    output out, carryOut;
    input inA, inB, carryIn;

    assign carryOut = (inA & inB) | (inA & carryIn) | (inB & carryIn);
    assign out = inA ^ inB ^ carryIn;
endmodule
