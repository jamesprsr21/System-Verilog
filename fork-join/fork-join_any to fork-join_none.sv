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
////////////////////////////////////////////////OR////////////////////////////////////////////
//fork-join_any    to    fork-join_none
module tb;

  initial
    begin
      fork
        $display();  //after this process at 0 simulation time it will go out to D and the whole process would work like fork join_none
         $display("A");  
        
         $display("B"); 
      join_any
     
      $display("D");
    end
  
endmodule
/*
D
A
B
*/

///////////////////////////////////////// or incase of #0 delay process  /////////////////////////////
module tb;

  initial
    begin
      fork
        $display();  //after this process at 0 simulation time it will go out to D and the whole process would work like fork join_none
         $display("A");  
        
         #0 $display("B"); 
      join_any
     
       $display("D");
    end
  
endmodule
/*
D
A
B
*/
