`timescale 1ns / 1ps

module debounce(
    input wire in1,
    input wire clk1,
    input wire rst,
    output reg out1,
    output reg [1:0]q,
    output reg [26:0]counter,
    output reg [1:0]nq,
    output reg F
);

    always @(posedge clk1, negedge rst) begin
        if (!rst) begin
            q <= 0;
            out1 <= 0;
        end else begin
            q <= nq;
            out1 <= q[1];
        end
    end

    always @(*) begin
        case (q)
            0: begin
                if (in1) begin
                    nq = 1;
                    F = 1;
                end else begin
                    nq = 0;
                    F = 0;
                end
            end
            1: begin
                if (in1) begin
                    if (counter == 100000000) begin
                        nq = 2;
                        F = 0;
                    end else begin
                        nq = 1;
                        F = 1;
                    end
                end else begin
                    F = 0;
                    nq = 0;
                end
            end
            2: begin
                if (in1) begin
                    nq = 2;
                    F = 0;
                end else begin
                    nq = 3;
                    F = 1;
                end
            end
            3: begin
                if (!in1) begin
                    if (counter == 100000000) begin
                        nq = 0;
                        F = 0;
                    end else begin
                        nq = 3;
                        F = 1;
                    end
                end else begin
                    nq = 2;
                    F = 0;
                end
            end
            default: begin
                nq = 0;
                F = 0;
            end
        endcase
    end

    always @(posedge clk1) begin
        counter <= (F&&(counter<100000000)) ? counter + 1 : 0;
    end

endmodule