module alu(A, B, out, control, clock);
	input [7:0] A, B;
	input [3:0] control;
	input clock;
	output [7:0] out;
	reg [7:0] regA, regB, result, out;
	reg [3:0] regControl;

	always @(posedge clock) begin
		out <= result;
		regControl <= control;
		regA <= A;
		regB <= B;
	end

	always @(regControl or regA or regB) begin
		case (regControl)
			'b0000: result <= regA + regB;
			'b0001: result <= regA - regB;
			'b1000: result <= regA & regB;
			'b1001: result <= regA | regB;
			'b1010: result <= regA ^ regB;
			'b1011: result <= ~regA;
			'b1100: result <= regA >> 1;
			'b1101: result <= regA << 1;
			'b1110: result <= {regA[0], regA[7:1]};
			'b1111: result <= {regA[6:0], regA[7]};
		endcase
	end
endmodule
