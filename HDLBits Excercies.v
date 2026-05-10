//Question 4: Wire4
module top_module(
    input a,b,c,
    output w,x,y,z);
    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;
endmodule

//Question 5: Notgate
module top_module(input in, output out);
    assign out = ~in;
endmodule

//Question 6: Andgate
module top_module(input a, b, output out);
    assign out = and(out, a, b);
endmodule

//Question 7: Norgate
module top_module(input a, b, output out);
    assign out = ~(a|b);
endmodule

//Question 8: Xnorgate
module top_module(input a, b, output out);
    xnor(out, a, b);
endmodule

//Question 9: Wire decl
module top_module(input a,b,c,d, output out, out_n);
    wire and_ab;
    wire and_cd;
    assign and_ab = a&b;
    assign and_cd = c&d;
    assign out = and_ab| and_cd;
    assign out_n = ~out;
endmodule

//Question 10: 7458
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire and_p1ap1cp1b;
    wire and_p2ap2b;
    wire and_p2cp2d;
    wire and_p1fp1ep1d;
    and(and_p1ap1cp1b, p1a, p1c, p1b);
    and(and_p2ap2b, p2a, p2b);
    and(and_p2cp2d, p2c, p2d);
    and(and_p1fp1ep1d, p1f,p1e,p1d);
    or(p2y, and_p2ap2b, and_p2cp2d);
    or(p1y, and_p1fp1ep1d, and_p1ap1cp1b);
endmodule

//Question 12: Vector1
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
endmodule

//Question 13:Vector 2
`default_nettype none
module top_module(input [31:0] in, output [31:0] out);
    assign out[31:24] = in[7:0];
    assign out[23:16] = in[15:8];
    assign out[15:8] = in[23:16];
    assign out[7:0] = in[31:24];
endmodule

//Question 13: Vectorgates
module top_module(input [2:0] a, input [2:0] b, output [2:0] out_or_bitwise, output out_or_logical, output [5:0] out_not);
    assign out_or_bitwise = a|b;
    assign out_or_logical = a||b;
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a;
endmodule

//Question 14: Gates4
module top_module(input [3:0] in, output out_and, output out_or, output out_xor);
    assign out_and = in[3] & in[2] & in[1] & in[0];
    assign out_or = in[3] | in[2] | in[1] | in[0];
    xor(out_xor, in[3], in[2], in[1], in[0]);
endmodule

//Question 15: Vector3
module top_module(input [4:0] a,b,c,d,e,f, output [7:0] w, x, y ,z);
    assign {w,x,y,z} = {a,b,c,d,e,f,2'b11};
endmodule

//Question 16: Vectorr
module top_module(input [7:0] in, output [7:0] out);
    assign {out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]} = in;
endmodule