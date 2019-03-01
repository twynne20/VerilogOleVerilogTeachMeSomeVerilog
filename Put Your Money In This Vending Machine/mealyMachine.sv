`timescale 1ns / 1ps

module mealyMachine(input logic clock,
                    input logic reset,
                    input logic fiveKurus,
                    input logic tenCents,
                    input logic twentyFiveKurus,
                    output logic theProduct
                    );

typedef enum logic {State0, State1, State2, State3, State4, State5} statetype;
statetype currentState, nextState;

always_ff@(posedge clock, posedge reset)
    if(reset) currentState <= State0;
    else      currentState <=nextState;

always_comb
        case(currentState)
        State0:if (fiveKurus== 1'b1 && tenCents==1'b0 && twentyFiveKurus==1'b0)
                    nextState = State1;
               else if(fiveKurus== 1'b0 && tenCents==1'b1 && twentyFiveKurus==1'b0)
                    nextState=State2;
               else if(fiveKurus== 1'b0 && tenCents==1'b0 && twentyFiveKurus==1'b1)
                    nextState=State5;
               else
                    nextState = currentState;
        State1:if (fiveKurus== 1'b1 && tenCents==1'b0 && twentyFiveKurus==1'b0)
                    nextState = State2;
               else if(fiveKurus== 1'b0 && tenCents==1'b1 && twentyFiveKurus==1'b0)
                    nextState=State3;
               else if(fiveKurus== 1'b0 && tenCents==1'b0 && twentyFiveKurus==1'b1)
                    nextState=State0;
               else
                    nextState = currentState;
        State2:if (fiveKurus== 1'b1 && tenCents==1'b0 && twentyFiveKurus==1'b0)
                    nextState = State3;
               else if(fiveKurus== 1'b0 && tenCents==1'b1 && twentyFiveKurus==1'b0)
                    nextState=State4;
               else if(fiveKurus== 1'b0 && tenCents==1'b0 && twentyFiveKurus==1'b1)
                    nextState=State0;
               else
                    nextState = currentState;
        State3:if (fiveKurus== 1'b1 && tenCents==1'b0 && twentyFiveKurus==1'b0)
                    nextState = State4;
               else if(fiveKurus== 1'b0 && tenCents==1'b1 && twentyFiveKurus==1'b0)
                    nextState=State5;
               else if(fiveKurus== 1'b0 && tenCents==1'b0 && twentyFiveKurus==1'b1)
                    nextState=State0;
               else
                    nextState = currentState;
        State4:if (fiveKurus== 1'b1 && tenCents==1'b0 && twentyFiveKurus==1'b0)
                    nextState = State5;
               else if(fiveKurus== 1'b0 && tenCents==1'b1 && twentyFiveKurus==1'b0)
                    nextState=State0;
               else if(fiveKurus== 1'b0 && tenCents==1'b0 && twentyFiveKurus==1'b1)
                    nextState=State0;
               else
                    nextState = currentState;
        State5:if (fiveKurus== 1'b1 && tenCents==1'b0 && twentyFiveKurus==1'b0)
                   nextState = State0;
               else if(fiveKurus== 1'b0 && tenCents==1'b1 && twentyFiveKurus==1'b0)
                   nextState=State0;
               else if(fiveKurus== 1'b0 && tenCents==1'b0 && twentyFiveKurus==1'b1)
                   nextState=State0;
               else
                   nextState = currentState;
    default: nextState = State0;
    endcase
    //output Logic

    assign theProduct=((currentState==State5 & (fiveKurus | tenCents |twentyFiveKurus )) |
                       (currentState==State4 & (tenCents |twentyFiveKurus)) |
                       (currentState==State3 & (twentyFiveKurus))|
                       (currentState==State2 & (twentyFiveKurus))|
                       (currentState==State1 & (twentyFiveKurus)));
endmodule
