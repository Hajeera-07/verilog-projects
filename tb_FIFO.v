module tb;
  parameter data_width=8;
  parameter depth=8;
  parameter addr_width=3;//log2(depth)
  reg clk,rst;
  reg writen,readen;
  reg[data_width-1:0]datain;
  wire [data_width-1:0]dataout;
  wire  full;
  wire empty;
  fifo all(clk,rst,writen,readen,datain,dataout,full,empty);
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    rst=1;
    #14writen=0;readen=0;datain=0;
    #24rst=0;
    #34writen=1;readen=0;
    #44datain=7'd5;
    #45datain=7'd8;
    #57datain=7'd14;
    #57readen=1;
    #58readen=0;
    #74$finish;
  end
  initial begin
    $monitor("time=%0d clk=%b rst=%b writen=%d readen=%b datain=%0d dataout=%0d full=%b empty=%b",$time,clk,rst,writen,readen,datain,dataout,full,empty);
    $dumpfile("wave.vcd");
    $dumpvars();
  end
endmodule
