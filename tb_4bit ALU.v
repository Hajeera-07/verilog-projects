module tb;
  reg[3:0]a,b;
  reg[2:0]sel;
  wire carry;
  wire[3:0]rslt;
  alu uut(a,b,sel,carry,rslt);
  initial begin;
    a=4'd8;b=4'd9;sel=3'b000;
    #3 a=4'd3;b=4'd2;sel=3'b001;
    #3a=4'd3;b=4'd2;sel=3'b010;
    #3a=4'd3;b=4'd2;sel=3'b011;
    #3a=4'd3;b=4'd2;sel=3'b100;
    #3a=4'd3;b=4'd2;sel=3'b101;
    #3a=4'd3;b=4'd2;sel=3'b110;
    #3a=4'd3;b=4'd2;sel=3'b111;
  end
  initial begin
    $monitor("time=%0d a=%0d b=%0d sel=%d carry=%d rslt=%0d",$time,a,b,sel,carry,rslt);
    $dumpfile("wave.vcd");
    $dumpvars();
  end
endmodule
  