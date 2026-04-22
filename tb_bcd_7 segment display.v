module tb;
  reg [3:0]bcd;
  wire[6:0]seg;
  bcd_ssd all(bcd,seg);
  initial begin
    bcd=4'd0;
    #3bcd=4'd1;
    #3bcd=4'd2;
    #3bcd=4'd3;
    #3bcd=4'd4;
    #3bcd=4'd5;
    #3bcd=4'd6;
    #3bcd=4'd7;
    #3bcd=4'd8;
    #3bcd=4'd9;
  end
  initial begin
    $monitor("bcd=%0d seg=%b",bcd,seg);
    $dumpfile("wave.vcd");
    $dumpvars();
  end
endmodule
    
