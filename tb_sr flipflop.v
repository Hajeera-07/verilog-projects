module tb;
  reg clk,s,r;
  wire q,q0;
  srff all(clk,s,r,q,q0);
  initial clk=0;
  always#3 clk=~clk;
  initial begin
    r=1;
    #2 s=0;
    #2 s=1;
    #2 r=0;
    #2 s=0;
    #2 s=1;
    #2 s=0;
    #2 s=1;
    #9 $finish;
  end
  initial begin
    $monitor("time=%0t clk=%b s=%b r=%b q=%b q0=%b",$time,clk,s,r,q,q0);
    $dumpfile("wave.vcd");
    $dumpvars();
  end
endmodule