The child threads(A and B) inside fork-join block occurs concurrently/parallelly.
After completing all the child threads, it comes out of the fork-join block and executes the next Parent thread which is outside of the fork-join block.
//fork/join with no delay
module tb;
  initial
    begin
      fork  
         $display("A");  
     
         $display("B"); 
      join
        $display("C");
    end
  
endmodule
/*output
A
B
C
*/
==========================================================================================
//fork/join with some delay
module tb;
  initial
    begin
      fork  
    
         #2 $display("A");  
     
         #1 $display("B"); 
      join
        $display("C");
    end
  
endmodule
/*
B
A
C
*/

//fork/join with #0 delay
module tb;
  initial
    begin
      fork  
    
         #1 $display("A");  
     
         #0 $display("B"); 
      join
        $display("C");
    end
  
endmodule
/*
B
A
C
*/

//fork/join
module tb;
  initial
    begin
      fork  
    
         #0 $display("A");  
     
         #1 $display("B"); 
      join
        $display("C");
    end
  
endmodule
/*
A
B
C
*/
