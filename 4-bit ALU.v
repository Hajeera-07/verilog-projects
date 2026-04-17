module alu(a,b,sel,carry,rslt);
  input[3:0]a;
  input[3:0]b;
  input[2:0]sel;
  output reg[3:0]rslt;
  output reg carry;//for add and sub;
  always@(*)
    begin
      carry=0;
      case(sel)
        3'b000:{carry,rslt}=a+b;
        3'b001:{carry,rslt}=a-b;//carry act as borrow indicator
        3'b010:rslt=a*b;
        3'b011:rslt=a^b;
        3'b100:rslt=a&b;
        3'b101:rslt=~a;
        3'b110:rslt=a>>1;
        3'b111:rslt=b<<1;
        default:rslt=4'b0000;
      endcase
    end
endmodule
          