module demux(s1,s2,i0,i1,i2,i3,y);
  input y,s1,s2;
  output reg i0,i1,i2,i3;
  always@(*)begin
    i0=0;
    i1=0;
    i2=0;
    i3=0;
    case({s1,s2})
      2'b00:i0=y;
      2'b01:i1=y;
      2'b10:i2=y;
      2'b11:i3=y;
    endcase
  end
endmodule