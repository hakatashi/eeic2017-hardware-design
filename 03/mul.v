module mul(A, B, result, clock, start, finish);
	input [7:0] A, B;
	input clock, start;
	output [16:0] result;
	output finish;
	reg [16:0] number;
	reg [4:0] state;
	reg regFinish;

	always @(posedge clock) begin
		if (start == 1) begin
			number <= 0;
			state <= 0;
			regFinish <= 0;
		end else if (state == 8) begin
			state <= 10;
			regFinish <= 0;
		end else if (state < 8) begin
			if (state == 7) begin
				regFinish <= 1;
			end

			number <= (number << 1) + A * B[7 - state];
			state <= state + 1;
		end
	end

	assign result = number;
	assign finish = regFinish;
endmodule
