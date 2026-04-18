module tff(clk,rst,t,q,q0);
  input clk,rst,t;
  output q,q0;
  reg q;
  wire q0;
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else if(t)
        q<=~q;
      else
        q<=q;
    end
  assign q0=~q;
endmodule