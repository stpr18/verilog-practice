module ASRFF(s, r, q, qb, ck);
	input s, r, ck;
	output q, qb;
	reg q;
	
	always @(negedge ck) begin
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
	reg ck;
	wire q, qb;
	
	ASRFF asrfftest (a[1], a[0], q, qb, ck);
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, TEST);
		$monitor ("%t: ck:%b s:%b r:%b -> q:%b qb:%b", $time, ck, a[1], a[0], q, qb);
		
		ck <= 1;
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
	
	always #5 begin
		ck <= ~ck;
	end
endmodule