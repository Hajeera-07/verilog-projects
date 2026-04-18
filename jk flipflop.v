module jkff(clk,j,k,q,q0);
  input clk,j,k;
  output q,q0;
  reg q;
  wire q0;
  initial q=0;
  always@(posedge clk)
  begin
    if(!j&&!k)
      q<=q;//no change
    else if(!j&&k)
      q<=0;
    else if(j&&!k)
      q<=1;
    else
      q<=~q;
  end
  assign q0=~q;//toggles
endmodule