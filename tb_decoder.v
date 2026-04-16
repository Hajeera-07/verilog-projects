
module tb;
  reg a,b;
  wire y0,y1,y2,y3;
  decoder dut(a,b,y0,y1,y2,y3);
  initial begin
    a=0;b=0;#3
    a=0;b=1;#3
    a=1;b=0;#3
    a=1;b=1;
  end
  initial begin
    $monitor("time=%0d a=%b b=%b y0=%b y1=%b y2=%b y3=%b",$time,a,b,y0,y1,y2,y3);
  end
endmodule
    