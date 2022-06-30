module top_module(

    input clk,

    input areset,    

    input bump_left,

    input bump_right,

    input ground,

    input dig,

    output walk_left,

    output walk_right,

    output aaah,

    output digging ); 

    

    

    parameter LEFT=0,RIGHT=1,FALLING_LEFT=2,FALLING_RIGHT=3,DIGGING_LEFT=4,DIGGING_RIGHT=5;

    reg [2:0] state, next_state;

    

    always @(*) begin

        case(state)

            LEFT:           next_state=(~ground)   ?    FALLING_LEFT   : ((dig)?  DIGGING_LEFT:((bump_left)?RIGHT:LEFT));

            RIGHT:          next_state=(~ground)   ?    FALLING_RIGHT  : ((dig)?  DIGGING_RIGHT:((bump_right )?LEFT:RIGHT));  

            FALLING_LEFT:   next_state=(ground)    ?    LEFT           : FALLING_LEFT;

            FALLING_RIGHT:  next_state=(ground)    ?    RIGHT          : FALLING_RIGHT;

            DIGGING_LEFT:   next_state=(ground)    ?    DIGGING_LEFT   : FALLING_LEFT;

            DIGGING_RIGHT:  next_state=(ground)    ?    DIGGING_RIGHT  : FALLING_RIGHT;

        endcase

    end



    always @(posedge clk, posedge areset) begin

        if(areset)

            state<=LEFT;

        else

            state<=next_state;

    end

            

    assign walk_left=(state==LEFT);

    assign walk_right=(state==RIGHT);

    assign aaah=(state==FALLING_LEFT || state==FALLING_RIGHT);

    assign digging=(state==DIGGING_LEFT || state==DIGGING_RIGHT);           



endmodule
