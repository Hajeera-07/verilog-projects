module tb;
  reg d,reset,clk;
  wire q;
  dflipflop all(d,reset,clk,q);
  initial clk=0;
  always #5clk=~clk;
  initial begin
    reset=1;d=0;
    #10 d=1;
    #10 reset=0;d=0;
    #10 d=1;#10
    $finish;   
  end
  initial begin
   
    $monitor(" d=%b reset=%b clk=%b q=%b",d,reset,clk,q);
    $dumpfile("wave.vcd");
    $dumpvars();
    #50 $finish();
  end
endmodule