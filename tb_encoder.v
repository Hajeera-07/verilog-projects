module tb;
  reg i0,i1,i2,i3;
  wire y0,y1;
  encoder dut(i0,i1,i2,i3,y0,y1);
  initial begin
    i0=1;i1=0;i2=0;i3=0;#3
    i0=0;i1=1;i2=0;i3=0;#3
    i0=0;i1=0;i2=1;i3=0;#3
    i0=0;i1=0;i2=0;i3=1;
  end
  initial begin
    $monitor("time=%0d i0=%b i1=%b i2=%b i3=%b y0=%b y1=%b",$time,i0,i1,i2,i3,y0,y1);
    $dumpfile("wave.vcd");
    $dumpvars();
  end
endmodule