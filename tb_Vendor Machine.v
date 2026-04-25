module tb;
  reg clk,rst;
  reg[1:0]coin;
  wire item;
  vendor_mchn all(clk,rst,coin,item);
 initial clk=0;
  always #3clk=~clk;
  initial begin
    rst=1;
    coin=2'b00;
    #6 rst=0;

    #6coin=2'b01;
    #6coin=2'b10;
    #6coin=2'b01;
    #6 coin=2'b10;
    #24$finish;
  end
  initial begin
    $monitor("time=%0d clk=%d rst=%d coin=%b item=%b", $time,clk,rst,coin,item);
  end
endmodule
    
    
