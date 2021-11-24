
module usr_nbit(select, parallelin, left, right, parallelout, clk, rst);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  input clk;
  input left;
  input [3:0] parallelin;
  output [3:0] parallelout;
  input right;
  input rst;
  input [1:0] select;
  sky130_fd_sc_hd__or2_2 _19_ (
    .A(select[0]),
    .B(select[1]),
    .X(_09_)
  );
  sky130_fd_sc_hd__inv_2 _20_ (
    .A(_09_),
    .Y(_10_)
  );
  sky130_fd_sc_hd__inv_2 _21_ (
    .A(rst),
    .Y(_11_)
  );
  sky130_fd_sc_hd__o221a_2 _22_ (
    .A1(_15_),
    .A2(_10_),
    .B1(parallelout[1]),
    .B2(_09_),
    .C1(_11_),
    .X(_07_)
  );
  sky130_fd_sc_hd__o221a_2 _23_ (
    .A1(_17_),
    .A2(_10_),
    .B1(parallelout[0]),
    .B2(_09_),
    .C1(_11_),
    .X(_06_)
  );
  sky130_fd_sc_hd__o221a_2 _24_ (
    .A1(_16_),
    .A2(_10_),
    .B1(parallelout[2]),
    .B2(_09_),
    .C1(_11_),
    .X(_05_)
  );
  sky130_fd_sc_hd__buf_1 _25_ (
    .A(select[0]),
    .X(_12_)
  );
  sky130_fd_sc_hd__inv_2 _26_ (
    .A(_12_),
    .Y(_00_)
  );
  sky130_fd_sc_hd__buf_1 _27_ (
    .A(select[1]),
    .X(_13_)
  );
  sky130_fd_sc_hd__nor2_2 _28_ (
    .A(_00_),
    .B(_13_),
    .Y(_14_)
  );
  sky130_fd_sc_hd__a32o_2 _29_ (
    .A1(_12_),
    .A2(_13_),
    .A3(parallelin[0]),
    .B1(parallelout[1]),
    .B2(_14_),
    .X(_01_)
  );
  sky130_fd_sc_hd__a32o_2 _30_ (
    .A1(_12_),
    .A2(_13_),
    .A3(parallelin[3]),
    .B1(right),
    .B2(_14_),
    .X(_02_)
  );
  sky130_fd_sc_hd__a32o_2 _31_ (
    .A1(_12_),
    .A2(_13_),
    .A3(parallelin[1]),
    .B1(parallelout[2]),
    .B2(_14_),
    .X(_03_)
  );
  sky130_fd_sc_hd__a32o_2 _32_ (
    .A1(_12_),
    .A2(_13_),
    .A3(parallelin[2]),
    .B1(parallelout[3]),
    .B2(_14_),
    .X(_04_)
  );
  sky130_fd_sc_hd__o221a_2 _33_ (
    .A1(_18_),
    .A2(_10_),
    .B1(parallelout[3]),
    .B2(_09_),
    .C1(_11_),
    .X(_08_)
  );
  sky130_fd_sc_hd__mux2_1 _34_ (
    .A0(_01_),
    .A1(left),
    .S(_00_),
    .X(_17_)
  );
  sky130_fd_sc_hd__mux2_1 _35_ (
    .A0(_02_),
    .A1(parallelout[2]),
    .S(_00_),
    .X(_18_)
  );
  sky130_fd_sc_hd__mux2_1 _36_ (
    .A0(_03_),
    .A1(parallelout[0]),
    .S(_00_),
    .X(_15_)
  );
  sky130_fd_sc_hd__mux2_1 _37_ (
    .A0(_04_),
    .A1(parallelout[1]),
    .S(_00_),
    .X(_16_)
  );
  sky130_fd_sc_hd__dfxtp_2 _38_ (
    .CLK(clk),
    .D(_05_),
    .Q(parallelout[2])
  );
  sky130_fd_sc_hd__dfxtp_2 _39_ (
    .CLK(clk),
    .D(_06_),
    .Q(parallelout[0])
  );
  sky130_fd_sc_hd__dfxtp_2 _40_ (
    .CLK(clk),
    .D(_07_),
    .Q(parallelout[1])
  );
  sky130_fd_sc_hd__dfxtp_2 _41_ (
    .CLK(clk),
    .D(_08_),
    .Q(parallelout[3])
  );
endmodule





//module a32o_2
module sky130_fd_sc_hd__a32o_2 (X  ,A1  ,A2  ,A3  ,B1  ,B2);
    output X   ;
    input  A1  ;
    input  A2  ;
    input  A3  ;
    input  B1  ;
    input  B2  ;
    wire and0_out;
    wire and1_out;
    and                                and0        (and0_out         , A3, A1, A2           );
    and                                and1        (and1_out         , B1, B2               );
    or                                 or0         (X        , and1_out, and0_out   );

endmodule


//module buf_1
module   sky130_fd_sc_hd__buf_1 (A,X);
input A;
output X;

buf buf1 (X,A);

endmodule



//module dfxtp_2
module  sky130_fd_sc_hd__dfxtp_2 (CLK,D,Q);
input D, CLK;
output Q;
reg Q;

always@(posedge CLK)
begin
	Q<=D;
end
endmodule


//module inv_2
module sky130_fd_sc_hd__inv_2 (A,Y);
input A;
output Y;

not not1 (Y,A);

endmodule


//module mux2_1
module  sky130_fd_sc_hd__mux2_1 (A0,A1,S,X);
input A0,A1,S;
output X;

wire not_out,and_out1,and_out0;

not not0 (not_out,S);
and and0 (and_out0,not_out,A0);
and and1 (and_out1,S,A1);
or or0 (X,and_out0,and_out1);

endmodule


//module nor2_2
module   sky130_fd_sc_hd__nor2_2 (A,B,Y);
input A,B;
output Y;

nor nor1 (Y,A,B);
endmodule


//module o221a_2
module sky130_fd_sc_hd__o221a_2 (X   ,A1  ,A2  ,B1  ,B2  ,C1  ,);
    output X   ;
    input  A1  ;
    input  A2  ;
    input  B1  ;
    input  B2  ;
    input  C1  ;
    wire or0_out          ;
    wire or1_out          ;
    or                                 or0         (or0_out          , B2, B1                );
    or                                 or1         (or1_out          , A2, A1                );
    and                                and0        (X                , or0_out, or1_out, C1  );

endmodule


//module or2_2
module sky130_fd_sc_hd__or2_2(A,B,X);
input A,B;
output X;

or or1 (X,A,B);

endmodule
