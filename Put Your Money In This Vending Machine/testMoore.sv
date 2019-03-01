`timescale 1ns / 1ps

module testMoore();

logic clock, reset,fiveCents,tenCents,twentyFiveCents,theProduct;

mooreMachine test1 (clock, reset,fiveCents,tenCents,twentyFiveCents,theProduct);

always
begin
    clock = 1; #5; clock = 0; #5;
end

initial
begin
reset=0;fiveCents=0;tenCents=1;twentyFiveCents=0; #10;
fiveCents=1;tenCents=0;twentyFiveCents=0; #10;
fiveCents=1;tenCents=0;twentyFiveCents=0; #10;
fiveCents=0;tenCents=1;twentyFiveCents=0; #10;
fiveCents=0;tenCents=1;twentyFiveCents=0; #10;
fiveCents=0;tenCents=1;twentyFiveCents=0; #10;
fiveCents=0;tenCents=1;twentyFiveCents=0; #10;
fiveCents=0;tenCents=1;twentyFiveCents=0; #10;
fiveCents=0;tenCents=0;twentyFiveCents=0; #10;
end
endmodule
