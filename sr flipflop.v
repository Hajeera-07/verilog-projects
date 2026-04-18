module srff(clk,s,r,q,q0);
  input clk,s,r;
  output q,q0;
  reg q;
  wire q0;//complement of q
  always @(clk)
  begin
    if(!s&&r)//01
      q<=0;
    else if(s&&!r)//10
      q<=1;
    else if(!s&&!r)
      q<=q;//nochange//00
    else
      q<=1'bx;//nooutput
  end
  assign q0=~q;
endmodule