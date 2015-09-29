module FA(x, y, cin, s, cout);
	input x, y, cin;
	output s, cout;

	assign s = x & y & cin | ~x & ~y & cin | x & ~y & ~cin | ~x & y & ~cin;
	assign cout = x & y | y & cin | cin & x;
endmodule

module TEST;
	parameter BIT = 3;
	
	reg [BIT-1:0] a;
	wire s, cout;
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, TEST);
		$monitor ("%t: %b + %b + %b = %b%b", $time, a[2], a[1], a[0], cout, s);
		
		a <= 0;
		repeat(2**BIT-1) begin
			#10 a <= a + 1;
		end
		#10 $finish;
	end
	
	FA fatest (a[1], a[0], a[2], s, cout);
endmodule