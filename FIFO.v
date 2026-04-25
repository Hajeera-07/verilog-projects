module fifo(clk,rst,writen,readen,datain,dataout,full,empty);
  parameter data_width=8;
  parameter depth=8;
  parameter addr_width=3;//log2(depth)
  input clk,rst;
  input writen,readen;
  input[data_width-1:0]datain;
  output reg[data_width-1:0]dataout;
  output reg full;
  output reg empty;
  reg[data_width-1:0]mem[0:depth-1];
  reg[addr_width-1:0]wrtpntr;
  reg[addr_width-1:0]rdpntr;
  reg[addr_width:0]count;
  //write logic
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          wrtpntr<=0;
        end
      else if(writen && !full)begin
        mem[wrtpntr]<=datain;
        wrtpntr<=wrtpntr+1;
      end
    end
  //read logic
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          rdpntr<=0;
          dataout<=0;
        end
      else if(readen && !empty)
        begin
          dataout<=mem[rdpntr];
          rdpntr<=rdpntr+1;
        end
    end
  //counterlogic
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        count<=0;
      else
        begin
          case({writen && !full,readen && !empty})
            2'b10:count<=count+1;
            2'b01:count<=count-1;
            default:count<=count;
          endcase
        end
    end
  //full and empty logic
  always @(*)
    begin
      full=(count==depth);
      empty=(count==0);
    end
endmodule
