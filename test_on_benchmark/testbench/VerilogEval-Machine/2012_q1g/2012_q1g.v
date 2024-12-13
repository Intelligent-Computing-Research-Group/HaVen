module top_module (
	input [4:1] x,
	output logic f
);
always @(*)begin
	case(x)
		5'h00: f = 1'h1;
		5'h01: f = 1'h1;
		5'h02: f = 1'h0;
		5'h03: f = 1'h0;
		5'h04: f = 1'h1;
		5'h05: f = 1'h1;
		5'h06: f = 1'h1;
		5'h07: f = 1'h0;
		5'h08: f = 1'h0;
		5'h09: f = 1'h0;
		5'h0a: f = 1'h0;
		5'h0b: f = 1'h0;
		5'h0c: f = 1'h1;
		5'h0d: f = 1'h0;
		5'h0e: f = 1'h1;
		5'h0f: f = 1'h1;
	endcase
end

endmodule