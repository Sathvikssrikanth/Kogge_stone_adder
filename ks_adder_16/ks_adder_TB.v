module ks_adder_TB;

    reg               clk = 0;      // Initializing clock to 0
    reg               rst;
    reg  [15:0]  a;
    reg  [15:0]  b;
    reg               cin;
    wire [15:0] sum;
    wire             cout;

    // Instantiating the adder module
    ks_adder a1 (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Generating clock with a period 10
    always #5 clk = ~clk;

    // Adding different testcases
    initial begin
        rst = 1'b1; #25;    // Reset applied initially
        rst = 1'b0;
        a = 16'h0000; b = 16'h0000; cin = 1'b0; #10;
        a = 16'h0001; b = 16'h0002; cin = 1'b0; #10;
        a = 16'h0004; b = 16'h0001; cin = 1'b0; #10;
        a = 16'hFFFF; b = 16'h0000; cin = 1'b0; #10;
        a = 16'h1234; b = 16'hFEDC; cin = 1'b1; #10;   // Testcase with Carry input = 1
        a = 16'hAAAA; b = 16'h5555; cin = 1'b0; #10;

        $display("Testbench complete."); #20;
        $finish;
    end

    // Creation of vcd dumpfile for output waveform
    initial begin
        $dumpfile("ks_adder.vcd");
        $dumpvars(0, a1);
    end

endmodule
