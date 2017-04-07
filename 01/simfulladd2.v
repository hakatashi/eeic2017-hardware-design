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
   FullAdderStructure adder(inA, inB, carryIn, carryOut, out);
endmodule

module FullAdderStructure(inA, inB, carryIn, carryOut, out);
    output out, carryOut;
    input inA, inB, carryIn;
    wire wire1, wire2, wire3, wire4, wire5;

    and and1(wire1, inA, inB);
    and and2(wire2, inB, carryIn);
    and and3(wire3, carryIn, inA);
    or or1(wire4, wire1, wire2);
    or or2(carryOut, wire4, wire3);
    xor xor1(wire5, inA, inB);
    xor xor2(out, wire5, carryIn);
endmodule
