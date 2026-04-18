module tb;
  reg clk,j,k;
  wire q,q0;
  jkff all(clk,j,k,q,q0);
  initial clk=0;
  always #5clk=~clk;
  initial begin
    j=0;k=1;#10
    j=0;k=0;#10
    j=1;k=0;#10
    j=1;k=1;#10
    $finish;
  end
  initial begin
    $monitor("time=%0t clk=%b j=%b k=%b q=%b q0=%b",$time,clk,j,k,q,q0);
  end
endmodule
    