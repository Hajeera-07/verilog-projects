module tb;
  reg y,s1,s2;
  wire i0,i1,i2,i3;
  demux dut(s1,s2,i0,i1,i2,i3,y);
  initial begin
    y=1;
    s1=0;s2=0;
    #6 s1=0;s2=1;
    #9 s1=1;s2=0;
    #12 s1=1;s2=1;
  end
  initial begin
    $monitor("time=%0d y=%b s1=%b s2=%b i0=%b i1=%b i2=%b  i3=%b",$time,y,s1,s2,i0,i1,i2,i3);
    $dumpfile("wave.vcd");
    $dumpvars();
  end
endmodule
    