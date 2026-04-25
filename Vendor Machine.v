module vendor_mchn(clk,rst,coin,item);

  input clk,rst;
  input [1:0] coin;
  output reg item;

  typedef enum logic [1:0] {
    r0  = 2'b00,
    r5  = 2'b01,
    r10 = 2'b10
  } state_t;

  state_t state, next;

  // State update
  always @(posedge clk or posedge rst) begin
    if(rst)
      state <= r0;
    else 
      state <= next;
  end

  // Next state + output logic
  always @(*) begin
    item = 0;
    next = state;

    case(state)

      r0: begin
        if(coin == 2'b01)
          next = r5;
        else if(coin == 2'b10)
          next = r10;
        else
          next = r0;
      end

      r5: begin
        if(coin == 2'b01)
          next = r10;
        else if(coin == 2'b10) begin
          item = 1;
          next = r0;
        end
      end

      r10: begin
        item = 1;
        next = r0;
      end

    endcase
  end

endmodule
