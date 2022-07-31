module testbench;
wire access,alarm;
reg [31:0]in;
reg clk,reset;
reg[2:0] current_state, next_state;
  password p0(access,alarm,in,reset,clk);
 

initial begin
 clk = 0;
 forever #10 clk = ~clk;
 end

initial begin
	 in='h12345678;reset=0;
	#40 in='h14343542;  
	#40 in='h1242adcb;
	#40 in='h1234abcd;
	#40 in='h14343542;
	#40 in='h12345678;	reset=1;
	#40 in='h12342378;	reset=0;
	#40 in='h1234abcd;
	#40 in='h12345678;
	#40 in='h12acfe38;	reset=1;
	#40 in='h12345678;	reset=0;
	#40 in='h1242adcb;
	#40 in='h1234abcd;	
	#10 $stop;
end
initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    #400 $finish;
 end

endmodule