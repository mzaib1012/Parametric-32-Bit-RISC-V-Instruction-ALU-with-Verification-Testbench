// testbench.sv
module tb;
    parameter WIDTH = 32;
    logic [WIDTH-1:0] a, b;
    logic [3:0] alu_ctrl;
    logic [WIDTH-1:0] result;
    logic zero;

    alu #(.WIDTH(WIDTH)) dut (.*);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        
        // Randomized Stimulus
        for(int i=0; i<10; i++) begin
            a = $urandom;
            b = $urandom;
            alu_ctrl = i % 6; // Cycle through operations
            #10;
            $display("Ctrl:%b A:%h B:%h -> Result:%h Zero:%b", alu_ctrl, a, b, result, zero);
        end
        $finish;
    end
endmodule
