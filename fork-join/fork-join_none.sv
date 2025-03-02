The parent thread and the child thread runs parallelly.
However we can say that incase of same thread(CT and PT) delay, it comes out of the block and initially runs Parent thread then child thread.
//fork-join_none
module tb;
  initial
    begin
      fork  
    
         $display("A  at time:%0t",$time);  
     
         $display("B  at time:%0t",$time); 
      join_none
         $display("C  at time:%0t",$time);
    end
  
endmodule
/*
C  at time:0
A  at time:0
B  at time:0
*/
