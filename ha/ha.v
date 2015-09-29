module HA(x, y, s, cout);
	input x, y;
	output s, cout;

	assign s = x ^ y;
	assign cout = x & y;
endmodule

module TEST;
	parameter BIT = 2;
	
	reg [BIT-1:0] a;
	wire s, cout;
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, TEST);
		$monitor ("%t: %b + %b = %b%b", $time, a[1], a[0], cout, s);
		
		a <= 0;
		repeat(2**BIT-1) begin
			#10 a <= a + 1;
		end
		#10 $finish;
	end
	
	HA hatest (a[1], a[0], s, cout);
endmodule

