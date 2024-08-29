module mux (input a, b, ctrl, output reg y);
    always @(*) begin
        y = ctrl ? a : b;
    end
endmodule

//module mux (input a, b, ctrl, clk, output reg y);
//    always @(posedge clk) begin
//        y <= ctrl ? a : b;
//    end
//endmodule

