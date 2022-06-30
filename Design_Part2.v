module top_module(

    input clk,

    input areset,    

    input bump_left,

    input bump_right,

    input ground,

    output walk_left,

    output walk_right,

    output aaah ); 



    parameter LEFT=0, RIGHT=1,FALLING_LEFT=2,FALLING_RIGHT=3;

    reg [1:0] state, next_state;

    

    always @(*) begin

        case(state)

            LEFT:           next_state=(~ground)   ?    FALLING_LEFT   : ((bump_left)?RIGHT:LEFT);

            RIGHT:          next_state=(~ground)   ?    FALLING_RIGHT  : ((bump_right )?LEFT:RIGHT);  

            FALLING_LEFT:   next_state=(ground)    ?    LEFT           : FALLING_LEFT;

            FALLING_RIGHT:  next_state=(ground)    ?    RIGHT          : FALLING_RIGHT;

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

                

endmodule
