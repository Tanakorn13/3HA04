module musicbox(clk, sw1, sw2, sw3, spk1);

input clk, sw1, sw2, sw3;
output reg spk1;

reg [25:0] clk_counter = 0;
reg [25:0] limiter = 25_000_000;

parameter hundred = 1, ten = 9, digit = 7; // the last 3-digits of my student id is 197
reg [3:0] num = 10;

always @(*) begin
	
	if (sw1 == 0) begin
		num = hundred;
	end else if (sw2 == 0) begin
		num = ten;
	end else if (sw3 == 0) begin
		num = digit;
	end else begin
		num = 10;
	end
	
	case(num)
		1: limiter = 25_000_000 / 262;
		7: limiter = 25_000_000 / 494;
		9: limiter = 25_000_000 / 587;
		default: limiter = 0;
	endcase
	
end

always @(posedge clk) begin

	clk_counter = clk_counter + 1;
	if (clk_counter >= limiter) begin
		if (limiter > 0) begin
			spk1 = ~spk1;
		end else begin
			spk1 = 0;
		end
		clk_counter = 0;
	end

end

endmodule