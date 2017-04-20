module simstm;
	reg clock, reset;
	wire [3:0] x;

	initial begin
		$dumpvars;
		$dumpfile("stm.vcd");
		$monitor("st = %b: x=%x", stateMachine.state, x);

		clock = 0;
		reset = 0;

		#20
		reset = 1;

		#60
		reset = 0;

		#1000
		$finish;
	end

	always #10 clock = ~clock;

	stm stateMachine(clock, reset, x);
endmodule
