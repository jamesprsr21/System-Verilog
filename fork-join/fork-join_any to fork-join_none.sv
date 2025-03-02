//////////////////// FORK-JOIN_ANY  TO  FORK_JOIN_NONE  ////////////////////////////////
module tb;
event ev;  //Declare an event
  initial
    begin
      fork  
        -> ev;  //trigger an event itself considered as a Child thread. So after completing this thread it comes out of fork/join_any block
         $display("A");  
        wait(ev.triggered);
         $display("B"); 
      join_any
         $display("C");
    end
  
endmodule

/* OUTPUT-
C
A
B
*/
