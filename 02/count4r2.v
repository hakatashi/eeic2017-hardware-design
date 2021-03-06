module count4r2(result, clock, reset);
	output [3:0] result;
	input clock, reset;
	reg [3:0] number;

	always @(posedge clock or negedge reset) begin
		if (!reset) begin
			number <= 0;
		end else begin
			number <= number + 2;
		end
	end

	assign result = number;
endmodule
