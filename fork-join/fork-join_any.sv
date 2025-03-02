The child threads(A and B) occuring parallelly.
But when any of the child threads A or B completed depending on the short/less delay, Then simulator comes of the fork-join_any block.
Then The parent thread(i.e outside of the fork-join_any block) and the remaining child threads occures parallelly.
//fork-join_any
module tb;
  initial
    begin
      fork  
          $display("A");  
     
          $display("B"); 
      join_any
        $display("C");
    end
  
endmodule
/*
A
C
B
*/
