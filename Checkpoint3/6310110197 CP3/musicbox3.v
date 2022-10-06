module musicbox3(clk, spk1);
input clk;
output spk1;
parameter inClk = 50000000; 	//reference clock
parameter c4 = inClk/261/2; //Do4 261Hz
parameter d4 = inClk/293/2; //Re4 293Hz
parameter e4 = inClk/329/2; //Mi4 329Hz
parameter f4 = inClk/349/2; //Fa4 349Hz
parameter g4 = inClk/392/2; //Sol4 392Hz
parameter a4 = inClk/440/2; //La4 440Hz
parameter b4 = inClk/493/2; //Si4 493Hz
parameter c5 = c4/2; //Do5 522Hz
parameter d5 = d4/2; //Re5 586Hz
parameter e5 = e4/2; //Mi5 658Hz
parameter f5 = f4/2; //Fa5 698Hz
parameter g5 = g4/2; //Sol5 784Hz
parameter a5 = a4/2; //La5 880Hz
parameter b5 = b4/2; //Si5 986Hz
parameter stop = 0; //stop note
parameter refreshT = inClk/60*20; //0.5 seconds
// parameter refreshT = inClk/2;
reg [26:0] clkRefresh, countUp;
reg [16:0] counter;
reg spk1;

always @(posedge clk) begin
  clkRefresh = clkRefresh + 1;
  if(clkRefresh == refreshT) begin
    if(countUp < 80) countUp = countUp + 1; else countUp = 0;
    clkRefresh = 0;
  end
    if(counter == 0 && countUp < 2) counter <= f5-1;
    else if(counter == 0 && countUp < 3) counter <= stop;
	 else if(counter == 0 && countUp < 4) counter <= f5-1;
    // else if(counter == 0 && countUp < 3) counter <= g4-1;
    else if(counter == 0 && countUp < 5) counter <= d5-1;
    else if(counter == 0 && countUp < 6) counter <= f5-1;
    else if(counter == 0 && countUp < 8) counter <= g5-1;
	 else if(counter == 0 && countUp < 9) counter <= stop;
    else if(counter == 0 && countUp < 10) counter <= a5-1;
	 else if(counter == 0 && countUp < 12) counter <= stop;
    else if(counter == 0 && countUp < 18) counter <= stop;
    
    else if(counter == 0 && countUp < 19) counter <= a5-1;
    else if(counter == 0 && countUp < 20) counter <= stop;
	 else if(counter == 0 && countUp < 21) counter <= a5-1;
	 else if(counter == 0 && countUp < 22) counter <= g5-1;
	 else if(counter == 0 && countUp < 23) counter <= stop;
	 else if(counter == 0 && countUp < 24) counter <= g5-1;
	 else if(counter == 0 && countUp < 25) counter <= f5-1;
	 else if(counter == 0 && countUp < 27) counter <= e5-1;
	 else if(counter == 0 && countUp < 28) counter <= g5-1;
	 
	 else if(counter == 0 && countUp < 30) counter <= stop;
	 else if(counter == 0 && countUp < 31) counter <= g5-1;
	 else if(counter == 0 && countUp < 32) counter <= f5-1;
	 else if(counter == 0 && countUp < 33) counter <= stop;
	 else if(counter == 0 && countUp < 34) counter <= f5-1;
	 else if(counter == 0 && countUp < 35) counter <= e5-1;
	 else if(counter == 0 && countUp < 36) counter <= d5-1;
    
	 else if(counter == 0 && countUp < 37) counter <= f4-1;
	 else if(counter == 0 && countUp < 38) counter <= d4-1;
	 else if(counter == 0 && countUp < 39) counter <= f4-1;
	 else if(counter == 0 && countUp < 40) counter <= d4-1;
	 else if(counter == 0 && countUp < 41) counter <= f4-1;
	 else if(counter == 0 && countUp < 43) counter <= g4-1;
	 else if(counter == 0 && countUp < 44) counter <= a4-1;
	 else if(counter == 0 && countUp < 46) counter <= stop;
	 else if(counter == 0 && countUp < 50) counter <= stop;
	 else if(counter == 0 && countUp < 52) counter <= stop;
	 
	 else if(counter == 0 && countUp < 54) counter <= a4-1;
	 else if(counter == 0 && countUp < 55) counter <= stop;
	 else if(counter == 0 && countUp < 56) counter <= a4-1;
	 else if(counter == 0 && countUp < 57) counter <= g4-1;
	 else if(counter == 0 && countUp < 58) counter <= stop;
	 else if(counter == 0 && countUp < 59) counter <= g4-1;
	 else if(counter == 0 && countUp < 60) counter <= f4-1;
	 else if(counter == 0 && countUp < 62) counter <= e4-1;
	 else if(counter == 0 && countUp < 63) counter <= g4-1;
	 
	 else if(counter == 0 && countUp < 65) counter <= stop;
	 else if(counter == 0 && countUp < 66) counter <= g4-1;
	 else if(counter == 0 && countUp < 67) counter <= f4-1;
	 else if(counter == 0 && countUp < 68) counter <= stop;
	 else if(counter == 0 && countUp < 69) counter <= f4-1;
	 else if(counter == 0 && countUp < 70) counter <= e4-1;
	 else if(counter == 0 && countUp < 71) counter <= d4-1;
	 else if(counter == 0 && countUp < 72) counter <= stop;
	 else if(counter == 0 && countUp < 73) counter <= d4-1;
	 
    else if(counter != 0) counter <= counter-1;
end

always @(posedge clk) if(counter == 0) spk1 <= ~spk1;
endmodule
