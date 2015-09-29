module SRFF(s, r, q, qb);
	input s, r;
	output q, qb;
	reg q;
	
	always @(s or r) begin
		if (s)
			q <= 1;
		else if (r)
			q <= 0;
	end
	
	assign qb = ~q;
endmodule

module TEST;
	parameter BIT = 2;
	
	reg [BIT-1:0] a;
	wire q, qb;
	
	SRFF srfftest (a[1], a[0], q, qb);
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, TEST);
		$monitor ("%t: s:%b r:%b -> q:%b qb:%b", $time, a[1], a[0], q, qb);
		
		a <= 2'b00;
		#10 a <= 2'b10;
		#10 a <= 2'b00;
		#10 a <= 2'b01;
		#10 a <= 2'b00;
		#10 a <= 2'b01;
		#10 a <= 2'b00;
		#10 a <= 2'b10;
		#10 $finish;
	end
endmodule