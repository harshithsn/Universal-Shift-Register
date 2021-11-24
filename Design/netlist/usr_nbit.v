`timescale 1ns / 1ps
module usr_nbit(select, parallelin, left, right, parallelout, clk, rst);
  parameter size = 4;
  input [1:0]select;
  input [size-1:0] parallelin;
  input left;
  input right;
  input clk,rst;
  output [size-1:0] parallelout;

genvar i;

universal_shift_register_1bit m0(.select(select),.parallelin(parallelin[0]),.left(left),.right(parallelout[1]),.parallelout(parallelout[0]),.clk(clk),.rst(rst));

generate for (i=1;i<=size-2;i=i+1)
	begin
		universal_shift_register_1bit m1(.select(select),.parallelin(parallelin[i]),.left(parallelout[i-1]),.right(parallelout[i+1]),.parallelout(parallelout[i]),.clk(clk),.rst(rst));
  	end
endgenerate

universal_shift_register_1bit mn(.select(select),.parallelin(parallelin[size-1]),.left(parallelout[size-2]),.right(right),.parallelout(parallelout[size-1]),.clk(clk),.rst(rst));
endmodule

module universal_shift_register_1bit(select, parallelin, left, right, parallelout, clk, rst);
  input [1:0] select; 
  input parallelin;
  input left;
  input right;
  input clk,rst;
  output parallelout;
  reg parallelout;
  always @(posedge clk)
    begin
	if (rst)
	begin
		parallelout<=1'b0;
	end
	else
	begin
		case(select)
			2'b00:
			begin
				parallelout <= parallelout;
                        end
                        2'b10:
                        begin
                        	parallelout <= left;
        		end
      			2'b01:
        		begin
          			parallelout <= right;
        		end
      			2'b11:
        		begin
          			parallelout <= parallelin;
        		end
		endcase
	end
      
    end
endmodule
