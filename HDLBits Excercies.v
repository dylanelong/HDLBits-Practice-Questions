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

//Question 14: Vectorgates
module top_module(input [2:0] a, input [2:0] b, output [2:0] out_or_bitwise, output out_or_logical, output [5:0] out_not);
    assign out_or_bitwise = a|b;
    assign out_or_logical = a||b;
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a;
endmodule

//Question 15: Gates4
module top_module(input [3:0] in, output out_and, output out_or, output out_xor);
    assign out_and = in[3] & in[2] & in[1] & in[0];
    assign out_or = in[3] | in[2] | in[1] | in[0];
    xor(out_xor, in[3], in[2], in[1], in[0]);
endmodule

//Question 16: Vector3
module top_module(input [4:0] a,b,c,d,e,f, output [7:0] w, x, y ,z);
    assign {w,x,y,z} = {a,b,c,d,e,f,2'b11};
endmodule

//Question 17: Vectorr
module top_module(input [7:0] in, output [7:0] out);
    assign {out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]} = in;
endmodule

//Question 18: Vector4
module top_module(input [7:0] in, output [31:0] out);
    assign out = {{24{in[7]}}, in};
endmodule

//Question 19: Vector5
module top_module(input a,b,c,d,e, output [24:0] out);
    assign out = ~{{5{a}},{5{b}}, {5{c}}, {5{d}}, {5{e}}} ^ {5{{a,b,c,d,e}}};
endmodule

//Question 20: Module
module top_module(input a, input b, output out);
    mod_a instance1 (.out(out), .in1(a), .in2(b));
endmodule

//Question 21: Module pos
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2);
    mod_a instance1 (out1, out2, a,b,c,d);
endmodule

//Question 22: Module name
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1 (.in1(a), .in2(b), .in3(c), .in4(d), .out1(out1), .out2(out2));
endmodule

//Question 23: Module shift
module top_module ( input clk, input d, output q );
    wire one_two;
    wire two_three;
    wire three_out;
    my_dff dff1 (clk, d, one_two);
    my_dff dff2 (clk, one_two, two_three);
    my_dff dff3 (clk, two_three, three_out);
    assign q = three_out;
endmodule

//Question 24: Module shift8
module mux (
    input [1:0] sel_mux, 
    input [7:0] zero, 
    input [7:0] one, 
    input [7:0] two, 
    input [7:0] three, 
    output reg [7:0] q_mux  
);

    always @(*) begin
        case (sel_mux)
            2'b00: q_mux = zero;
            2'b01: q_mux = one;
            2'b10: q_mux = two;
            2'b11: q_mux = three;
            default: q_mux = 8'b0; 
        endcase
    end
endmodule

module top_module (input clk, input [7:0] d, input [1:0] sel, output [7:0] q);
    wire [7:0] one_two;
    wire [7:0] two_three;
    wire [7:0] three_mux;
    wire [7:0] two_mux;
    wire [7:0] one_mux;
    wire [7:0] zero_mux;
    my_dff8 dff1 (clk, d, one_two);
    my_dff8 dff2 (clk, one_two, two_three);
    my_dff8 dff3 (clk, two_three, three_mux);
    assign one_mux = one_two;
    assign two_mux  = two_three;
    mux mux1 (sel, d, one_mux, two_mux, three_mux, q);
endmodule

//Question 25: Module add
module top_module(input [31:0] a, input [31:0] b, output [31:0] sum);
    wire carry_connection;
    wire [15:0] lower_out;
    wire [15:0] upper_out;
    wire sink;
    add16 adder1(a[15:0],b[15:0], 1'b0, lower_out, carry_connection);
    add16 adder2(a[31:16], b[31:16], carry_connection, upper_out, sink);
    assign sum = {upper_out, lower_out};
endmodule

//Question 26: Module fadd
module add1(input a, input b, input cin, output sum, output cout);
    assign cout = (a&b)|(a&cin)|(b&cin);
    assign sum = a^b^cin;
endmodule
module top_module(input [31:0] a, input [31:0] b, output [31:0] sum);
    wire [15:0] low_sum;
    wire intermediate_carry;
    wire [15:0] high_sum;
    add16 adder1 (a[15:0], b[15:0], 1'b0, low_sum, intermediate_carry);
    add16 adder2 (a[31:16], b[31:16], intermediate_carry, high_sum, );
    assign sum = {high_sum, low_sum};
endmodule

//Question 27: Module cseladd
module mux2to1(input [15:0] sum1, input [15:0] sum2, input cin, output [15:0] out);
    always @(*) begin
        case (cin)
            1'b0: out = sum1;
            1'b1: out = sum2;
        endcase
    end
endmodule

module top_module(input [31:0] a, input [31:0] b, output [31:0] sum);
    wire [15:0] low_sum;
    wire [15:0] high_sum0;
    wire [15:0] high_sum1;
    wire [15:0] high_sum;
    wire cout;
    add16 adder1(a[15:0], b[15:0], 1'b0, low_sum, cout);
    add16 adder2(a[31:16], b[31:16], 1'b0, high_sum0,);
    add16 adder3(a[31:16], b[31:16], 1'b1, high_sum1,);
    mux2to1 mux(high_sum0, high_sum1, cout, high_sum);
    assign sum = {high_sum, low_sum};
endmodule

//Question 28: Module addsub
module xorgate(input [31:0] in1, input sub, output [31:0] result);
    always @(*) begin
        case (sub)
            1'b0: result = in1;
            1'b1: result = {32{sub}} ^ in1;
        endcase
    end

endmodule

module top_module(input [31:0] a, input [31:0] b, input sub, output [31:0] sum);
    wire int_carry;
    wire [15:0] low_sum;
    wire [15:0] high_sum;
    wire [31:0] term2;
    xorgate gate(b, sub, term2);
    add16 adder1(a[15:0], term2[15:0], sub, low_sum, int_carry);
    add16 adder2(a[31:16], term2[31:16], int_carry, high_sum, );
    assign sum = {high_sum, low_sum};
endmodule

//Question 29: Alwaysblock1
module top_module(input a, input b, output wire out_assign, output reg out_alwaysblock);
    assign out_assign = a&b;
    always @(*) out_alwaysblock = a&b;
endmodule

//Question 30: Alwaysblock2
module top_module(input clk, input a, input b, output wire out_assign, output reg out_always_comb, output reg out_always_ff);
    assign out_assign = a ^ b;
    always @(*) out_always_comb = a ^ b;
    always @(posedge clk) out_always_ff = a ^ b;
endmodule

//Question 31: Always if 
module top_module(input a, input b, input sel_b1, input sel_b2, output out_assign, output reg out_always);
    assign out_assign = (sel_b1&sel_b2) ? b :a;
    always @(*) begin
        if (sel_b1&sel_b2) begin
            out_always = b;
        end
        else begin
            out_always = a;
        end
    end
endmodule

//Question 32: Always if2
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); 
    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else 
            shut_off_computer = 0;
    end
    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else
            keep_driving = 0;
    end

endmodule

//Question 33: Always case
module top_module(input[2:0] sel, input [3:0] data0, input [3:0] data1, input [3:0] data2, input [3:0] data3, input [3:0] data4, input [3:0] data5, output reg [3:0] out);
    always @(*) begin
        case (sel) 
            3'b000: out = data0;
            3'b001: out = data1;
            3'b010: out = data2;
            3'b011: out = data3;
            3'b100: out = data4;
            3'b101: out = data5;
            default: out = 4'b0000;
        endcase
    end
endmodule

//Question 34: Always case2
module top_module(input [3:0] in, output reg [1:0] pos);
    always @(*) begin
        if (in[0] == 1) begin
            pos = 2'b00;
        end
        else if (in[1] == 1) begin
            pos = 2'b01;
        end 
        else if (in[2]==1) begin
            pos = 2'b10;
        end
        else if (in[3]==1) begin
            pos = 2'b11;
        end
        else begin
            pos = 2'b00;
        end
    end
endmodule

//Question 35: Always case 2
module top_module(input [7:0] in, output [2:0] pos);
    always @(*) begin
        casez (in[7:0]) 
            8'bzzzzzzz1: pos = 3'b000;
            8'bzzzzzz10: pos = 3'b001;
            8'bzzzzz100: pos = 3'b010;
            8'bzzzz1000: pos = 3'b011;
            8'bzzz10000: pos = 3'b100;
            8'bzz100000: pos = 3'b101;
            8'bz1000000: pos = 3'b110;
            8'b10000000: pos = 3'b111;
            default: pos = 3'b000;
        endcase
    end
endmodule

//Question 36: Always nolatches
module top_module(input [15:0] scancode, output reg left, output reg down, output reg right, output reg up);
    always @(*) begin
        left = 1'b0;
        right = 1'b0;
        up = 1'b0;
        down = 1'b0;
        case (scancode[15:0])
            16'he06b: left = 1'b1;
            16'he072: down = 1'b1;
            16'he074: right = 1'b1;
            16'he075: up = 1'b1;
        endcase
    end
endmodule

//Question 37: Conditional
module two_way_min(input [7:0] a, input [7:0] b, output reg [7:0] min);
    always @(*) begin
        min=a < b ? a: b;
    end
endmodule

module top_module(input [7:0] a, input [7:0] b, input [7:0] c, input [7:0] d, output [7:0] min);
    wire [7:0] min1;
    wire [7:0] min2;
    two_way_min mod1 (a,b,min1);
    two_way_min mod2 (c,d,min2);
    two_way_min mod3 (min1, min2, min);
endmodule

//Question 38: Reduction
module top_module(input [7:0] in, output parity);
    assign parity = ^in[7:0];
endmodule

//Question 39: Gates100
module top_module (input [99:0] in, output out_and, output out_or, output out_xor);
    assign out_and = &in[99:0];
    assign out_or = |in[99:0];
    assign out_xor = ^in[99:0];
endmodule

//Question 40: Vector100r
module top_module(input [99:0] in, output reg [99:0] out);
    always @(*) begin
        integer in_idx;
        integer out_idx;
        out_idx = 0;
        for (in_idx = 99; in_idx >= 0; in_idx = in_idx - 1) begin
            out[out_idx] = in[in_idx];
            out_idx = out_idx + 1;
        end
    end
endmodule

//Question 41: Popcount225
module top_module(input [254:0] in, output reg [7:0] out);
    integer idx;
    always @(*) begin
        out = 8'd0;
        for (idx = 0; idx < 255; idx = idx + 1) begin
            out = out + in[idx];
        end
    end
endmodule

//Question 42: Adder 100i
module full_adder (input a, input b, input cin, output cout, output sum);
    assign cout = (a&b)|(b&cin)|(cin&a);
    assign sum = a^b^cin;
endmodule

module top_module(input [99:0] a, b, input cin, output [99:0] cout, output  [99:0] sum);
    genvar i;
    generate
        for (i = 0; i < 100; i = i+1) begin: gen_case
            if (i == 0) begin
                full_adder adder(a[i], b[i], cin, cout[i], sum[i]);
            end
            else begin
                full_adder adder(a[i], b[i], cout[i-1], cout[i], sum[i]);
            end
        end
    endgenerate
endmodule

//Question 43: Bcfadd100
module top_module(input [399:0] a, b, input cin, output cout, output [399:0] sum);
    wire [100:0] carry;
    assign carry[0] = cin;   
    assign cout = carry[100]; 
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_adder_gen
            bcd_fadd adder (.a(a[4*i +: 4]), .b(b[4*i +: 4]), .cin(carry[i]), .cout(carry[i+1]), .sum(sum[4*i +: 4]));
        end
    endgenerate
endmodule

//Question 44: Wire
module top_module (
    input in,
    output out);
		assign out =in;
endmodule

//Question 45: GND
module top_module (
    output out);
    assign out = 1'b0;
endmodule

//Question 46: NOR
module top_module (
    input in1,
    input in2,
    output out);
    nor(out, in1, in2);
endmodule

//Question 47: Another gate
module top_module (
    input in1,
    input in2,
    output out);
    assign out = (~in2) & in1;
endmodule

//Question 48: Two gates
module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    assign out = in3 ^ ~(in1^in2);
endmodule

//Question 49: Gates
module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    assign out_and = a&b;
    assign out_or = a|b;
    assign out_xor = a^b;
    assign out_nand = ~(a&b);
    assign out_nor = ~(a|b);
    assign out_xnor = ~(a^b);
    assign out_anotb = a & (~b);
endmodule

//Question 50: 7420
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    assign p1y = ~(p1a&p1b&p1c&p1d);
    assign p2y = ~(p2a&p2b&p2c&p2d);
endmodule

//Question 51: Truthtable1
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    assign f = ((~x3)&x2) | (x3&x1);
endmodule

//Question 52: Mt2015 eq2
module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z = A == B
endmodule

//Question 53: Mt2015 q4a
module top_module (input x, input y, output z);
    assign z = (x^y) & x;
endmodule
//Question 54: Mt2015 q4b
module top_module ( input x, input y, output z );
    assign z = (~x&~y) | (x&y);
endmodule

//Question 55: Mt2015 q4
module top_module(input x, input y, output z);
    wire z1;
    wire z2;
    wire z3;
    wire z4;
    assign z1 = (x^y) & x;
    assign z2 = (~x&~y) | (x&y);
    assign z3 = (x^y) & x;
    assign z4 = (~x&~y) | (x&y);
    assign z = ((z1|z2)|(z3&z4));
endmodule

//Question 56: Ringer
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    assign ringer = ring & ~vibrate_mode;
    assign motor = ring & vibrate_mode;
endmodule

//Question 57: Thermostat
module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign heater = (too_cold & mode);
    assign aircon = (too_hot & ~mode);
    assign fan = fan_on | heater |aircon;
endmodule

//Question 58: Popcount3
module top_module( 
    input [2:0] in,
    output [1:0] out );
    always @(*) begin
        integer i;
        out = 2'b00;
        for (i=0;i<3;i=i+1)begin
            out = out + (in[i] == 1);
        end
    end
endmodule

//Question 59: Gatesv
module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different 
);
    assign out_both = in[2:0] & in[3:1];
    assign out_any = in[3:1] | in[2:0];
    assign out_different = in ^ {in[0], in[3:1]};
endmodule

//Question 60: Gatesv100
module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different 
);
    assign out_both = in[98:0] & in[99:1];
    assign out_any = in[99:1] | in[98:0];
    assign out_different = in ^ {in[0], in[99:1]};
endmodule

//Question 61: Mux2to1
module top_module( 
    input a, b, sel,
    output out ); 
    always @(*) begin
        case (sel)
            1'b0: out = a;
            1'b1: out = b; 
        endcase
    end
endmodule

//Question 62: Mux2to1v
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
    always @(*) begin       
        case (sel)
            1'b0: out = a;
            1'b1: out = b; 
        endcase
    end
endmodule

//Question 63: Mux9to1v
module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    always @(*) begin
        case (sel)
            4'b0000: out = a;
            4'b0001: out = b;
            4'b0010: out = c;
            4'b0011: out = d;
            4'b0100: out = e;
            4'b0101: out = f;
            4'b0110: out = g;
            4'b0111: out = h;
            4'b1000: out = i;
            default: out = {16{1'b1}};
        endcase
    end
endmodule

//Question 64: Mux256to1
module top_module(input [255:0] in, input [7:0] sel, output out);
    assign out = in[sel];
endmodule

//Question 65: mux256to1v
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    assign out = in[4*sel +: 4];
endmodule

//Question 66: Hadd
module top_module(input a, b, output cout, sum);
    assign cout = a&b;
    assign sum = a^b;
endmodule

//Question 67: Fadd
module top_module( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a&b)|(cin&a)|(cin&b);
    assign sum = a^b^cin;
endmodule

//Question 68: Adder3
module fadd( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a&b)|(cin&a)|(cin&b);
    assign sum = a^b^cin;
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    fadd fadd1 (a[0], b[0], cin, cout[0], sum[0]);
    fadd fadd2 (a[1], b[1], cout[0], cout[1], sum[1]);
    fadd fadd3 (a[2], b[2], cout[1], cout[2], sum[2]);
endmodule

//Question 69: Exams/m2014 q4j
module fadd( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a&b)|(cin&a)|(cin&b);
    assign sum = a^b^cin;
endmodule

module top_module( 
    input [3:0] x, y,
    output [4:0] sum );
    wire [2:0] cout;
    fadd fadd1 (x[0], y[0], 0, cout[0], sum[0]);
    fadd fadd2 (x[1], y[1], cout[0], cout[1], sum[1]);
    fadd fadd3 (x[2], y[2], cout[1], cout[2], sum[2]);
    fadd fadd4 (x[3], y[3], cout[2], sum[4], sum[3]);
endmodule

//Question 70: Exams/ece241 2014 q1c
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
    assign s = a + b;
    assign overflow = (s[7] !== a[7]) & (s[7] !== b[7]);
endmodule

//Question 71: Adder100
module fadd( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a&b)|(cin&a)|(cin&b);
    assign sum = a^b^cin;
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    generate
        genvar i;
        reg [100:0] carry;
        always @(*) begin
            carry[0] = cin;
        end
        for (i = 0; i < 100; i = i + 1) begin: adder_case
            fadd adder(a[i], b[i], carry[i], carry[i+1], sum[i]);
        end
        always @(*) begin
            cout = carry[100];
        end
    endgenerate
endmodule

//Question 72: Bcdadd4
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    reg [4:0] carry;
    assign carry[0] = cin;
    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin: add_case
            bcd_fadd adder (a[4*i +: 4], b[4*i +:4], carry[i], carry[i+1], sum[4*i+:4]);
        end
    endgenerate
    assign cout = carry[4];
endmodule

//Question 73: Kmap1
module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    assign out = a|b|c;
endmodule

//Question 74: Kmap2
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~b&~c)|(~a&~d)|(~a&b&c)|(a&c&d);
endmodule

//Question 75: Kmap3
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~b&c)|a;
endmodule

//Question 76: Kmap4
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	assign out =a^b^c^d;
endmodule

//Question 77: Exams/ece241 2013 q2
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_sop = (~a&~b&c)|(c&d);
    assign out_pos = c&(~b|d)&(~a|b);
endmodule

//Question 78: Exams/m2014q3
module top_module (
    input [4:1] x, 
    output f );
    assign f = (~x[1]&x[3])|(x[2]&x[4]);
endmodule

//Question 79: Exams/2012 q1g
module top_module (
    input [4:1] x,
    output f
); 
    assign f = (~x[2]&~x[4])|(~x[1]&x[3])|(x[2]&x[3]&x[4]);
endmodule

//Question 80: Exams/ece241 2014 q3
module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    assign mux_in[0] = c|d;
    assign mux_in[1] = 0;
    assign mux_in[2] = ~d;
    assign mux_in[3]  =c&d;
endmodule

//Question 81: Dff
module top_module (
    input clk,   
    input d,
    output reg q );
    always @(posedge clk) begin
        q = d;
    end

endmodule

//Question 82: Dff8
module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk) begin
        q = d;
    end
endmodule

//Question 83: Dff8r
module top_module (
    input clk,
    input reset,     
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk) begin
        if (reset == 1) begin
            q = {8{1'b0}};
        end
        else begin
            q = d;
        end
    end
endmodule

//Question 84: Dff8p
module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    always @(negedge clk) begin
        if (reset == 1) begin
            q = 8'h0x34;
        end
        else begin
            q = d;
        end
    end
endmodule

//Question 85: Dff8ar
module top_module (
    input clk,
    input areset,   
    input [7:0] d,
    output [7:0] q
);
    always  @(posedge clk or posedge areset) begin
        if (areset == 1) begin
            q = 8'b0;
        end
        else begin
            q = d;
        end
    end
endmodule

//Question 86: Dff16e
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        if (resetn == 0) begin
            q = 16'b0;
        end
        else begin
            if (byteena[0] == 1) begin
                q[7:0] = d[7:0];
            end
            if (byteena[1] == 1) begin
                q[15:8] = d[15:8];
            end
        end
    end
endmodule

//Question 87: Exams/m2014 q4a
module top_module (
    input d, 
    input ena,
    output q);
    always @(*) begin
        if (ena) begin
            q = d;
        end
    end
endmodule

//Question 88: Exams/m2014 q4b
module top_module (
    input clk,
    input ar,   
    input d,
    output q
);
    always  @(posedge clk or posedge ar) begin
        if (ar == 1) begin
            q = 1'b0;
        end
        else begin
            q = d;
        end
    end
endmodule

//Question 89: Exams/m2014 q4c
module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
    always @(posedge clk) begin
        if (r) begin
            q = 1'b0;
        end
        else begin 
            q= d;
        end
    end
endmodule

//Question 90: Exams/m2014 q4d
module top_module (
    input clk,
    input in, 
    output out);
    always @(posedge clk) begin
        out <= (in ^ out);
    end
endmodule

//Question 91: Mt2015 muxdff
module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

endmodule
