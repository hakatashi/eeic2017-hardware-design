module stm(clock, reset, x);
	input clock, reset;
	output [3:0] x;
	reg [3:0] x;
	reg state;

	always @(posedge clock) begin
		if (reset == 1) begin
			state <= 0;
			x <= 0;
		end else begin
			if (state == 0) begin
				if (x == 0) begin
					state <= 1;
				end else begin
					x <= x - 1;
				end
			end else begin
				if (x == 15) begin
					state <= 0;
				end else begin
					x <= x + 1;
				end
			end
		end
	end
endmodule
