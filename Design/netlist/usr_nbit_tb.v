`timescale 1ns / 1ps
`include "usr_nbit.v"
module usr_nbit_tb;
  parameter size =4;
  reg [1:0]select;
  reg [size-1:0] parallelin;
  reg left;
  reg right;
  reg clk,rst;
  wire [size-1:0] parallelout;

usr_nbit instantiation(.select(select), .parallelin(parallelin), .left(left), .right(right), .clk(clk), .rst(rst), .parallelout(parallelout));
initial begin

    $dumpfile("usr_n.vcd");
    $dumpvars(0, usr_nbit_tb);
    clk=0;
    #1;
    rst=1;
    select = 2'b00;
    left = 1'b1;
    right = 1'b1;
    parallelin = 4'b0000;
    #1;
    clk=1;
    #2
    clk=0;
    #1;
    rst=0;
    #1;
    clk=1;
    #2;
    clk=0;
    #1;
    select = 2'b11;
    parallelin = 4'b0110;
    #1;
    clk=1;
    #2;
    clk=0;
    #1;
    select = 2'b00;
    parallelin = 4'b1010;
    #1;
    clk=1;
    #2;
    clk=0;
    #1;
    select = 2'b01;
    parallelin = 4'b1010;
    #1;
    clk=1;
    #2;
    clk=0;
    #1;
    select = 2'b10;
    parallelin = 4'b1010;
    #1;
    clk=1;
    #2;
    clk=0;
    #1;
    select = 2'b00;
    parallelin = 4'b0001;
    #1;
    clk=1;
    #2;
    clk=0;
    #1;
    select = 2'b01;
    parallelin = 4'b1010;
    #1;
    clk=1;
    #2;
    clk=0;
    #1;
    select = 2'b10;
    parallelin = 4'b1010;
    #1;
    clk=1;
end

endmodule
