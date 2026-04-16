module tb;
  reg i0,i1,i2,i3,s0,s1;
  wire y;
  mux all(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.y(y));  
  initial begin 
  s0=0;s1=0;i0=1;i1=0;i2=0;i3=0;
 #3 s0=1;s1=0;i0=0;i1=1;i2=0;i3=0;
 #3 s0=0;s1=1;i0=0;i1=0;i2=1;i3=0;
 #3 s0=1;s1=1;i0=0;i1=0;i2=0;i3=1;
  end
  initial begin
    $monitor("i0=%b,i1=%b,i2=%b,i3=%b,s0=%b,s1=%b,y=%b",i0,i1,i2,i3,s0,s1,y);
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
  end
endmodule
  