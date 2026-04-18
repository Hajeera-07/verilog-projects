module tb;
  reg clk,rst,t;
  wire q,q0;
  tff all(clk,rst,t,q,q0);
  initial clk=0;
  always #3clk=~clk;
  initial begin
    rst=1;
    t=0;
    #6 t=1;
    #6 rst=0;
    #6t=1;
    #6t=0;
    #6 t=1;
    #6 $finish;
  end
  initial begin
    $monitor("time=%0t clk=%b rst=%b t=%b q=%b q0=%b",$time,clk,rst,t,q,q0);
  end
endmodule
  