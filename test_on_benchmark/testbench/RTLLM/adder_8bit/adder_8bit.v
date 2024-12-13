
module adder_8bit(
    input [7:0] a, b, 
    input cin, 
    output [7:0] sum, 
    output cout);

    wire [7:0] c;
    assign {c[0], sum[0]} = a[0] + b[0] + cin;
    assign {c[1], sum[1]} = a[1] + b[1] + c[0];
    assign {c[2], sum[2]} = a[2] + b[2] + c[1];
    assign {c[3], sum[3]} = a[3] + b[3] + c[2];
    assign {c[4], sum[4]} = a[4] + b[4] + c[3];
    assign {c[5], sum[5]} = a[5] + b[5] + c[4];
    assign {c[6], sum[6]} = a[6] + b[6] + c[5];
    assign {cout, sum[7]} = a[7] + b[7] + c[6];

endmodule

module full_adder(
    input a, b, cin, 
    output sum, cout);

    assign {cout, sum} = a + b + cin;


endmodule