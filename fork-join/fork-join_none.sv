The parent thread and the child thread runs parallelly.
However we can say that incase of same thread(CT and PT) delay, it comes out of the block and initially runs Parent thread then child thread.
i.e preference is parent thread incase of same delay.
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

module tb;
  initial
    begin
      fork  
    
         #1 $display("A  at time:%0t",$time);  
     
         #1 $display("B  at time:%0t",$time); 
      join_none
         #1 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
C  at time:1
A  at time:1
B  at time:1
*/

module tb;
  initial
    begin
      fork  
    
         #1 $display("A  at time:%0t",$time);  
     
         #1 $display("B  at time:%0t",$time); 
      join_none
          $display("C  at time:%0t",$time);
    end
  
endmodule
/*
C  at time:0
A  at time:1
B  at time:1
*/

module tb;
  initial
    begin
      fork  
    
           #1 $display("A  at time:%0t",$time);  
     
            $display("B  at time:%0t",$time); 
      join_none
           #1 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
B  at time:0
C  at time:1
A  at time:1
*/
module tb;
  initial
    begin
      fork  
    
            $display("A  at time:%0t",$time);  
     
           #1 $display("B  at time:%0t",$time); 
      join_none
           #1 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:0
C  at time:1
B  at time:1
*/

module tb;
  initial
    begin
      fork  
    
         #1 $display("A  at time:%0t",$time);  
     
          $display("B  at time:%0t",$time); 
      join_none
          $display("C  at time:%0t",$time);
    end
  
endmodule
/*
C  at time:0
B  at time:0
A  at time:1
*/

module tb;
  initial
    begin
      fork  
    
          $display("A  at time:%0t",$time);  
     
          #1 $display("B  at time:%0t",$time); 
      join_none
          $display("C  at time:%0t",$time);
    end
  
endmodule
/*
C  at time:0
A  at time:0
B  at time:1
*/

module tb;
  initial
    begin
      fork  
    
           $display("A  at time:%0t",$time);  
     
           $display("B  at time:%0t",$time); 
      join_none
          #1 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:0
B  at time:0
C  at time:1
*/

module tb;
  initial
    begin
      fork  
    
          #1 $display("A  at time:%0t",$time);  
     
          #2 $display("B  at time:%0t",$time); 
      join_none
          $display("C  at time:%0t",$time);
    end
  
endmodule
/*
C  at time:0
A  at time:1
B  at time:2
*/
module tb;
  initial
    begin
      fork  
    
           #2 $display("A  at time:%0t",$time);  
     
           #1 $display("B  at time:%0t",$time); 
      join_none
          $display("C  at time:%0t",$time);
    end
  
endmodule
/*
C  at time:0
B  at time:1
A  at time:2
*/

module tb;
  initial
    begin
      fork  
    
          #1 $display("A  at time:%0t",$time);  
     
          #2 $display("B  at time:%0t",$time); 
      join_none
          #3 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:1
B  at time:2
C  at time:3
*/

module tb;
  initial
    begin
      fork  
    
           #3 $display("A  at time:%0t",$time);  
     
           #2 $display("B  at time:%0t",$time); 
      join_none
           #1 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
C  at time:1
B  at time:2
A  at time:3
*/
