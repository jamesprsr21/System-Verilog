The child threads(A and B) occuring parallelly.
But when any of the child threads A or B completed depending on the short/less delay, Then simulator comes of the fork-join_any block.
Then The parent thread(i.e outside of the fork-join_any block) and the remaining child threads occures parallelly.
//fork-join_any with no delays
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

//with delays
module tb;
  initial
    begin
      fork  
    
        #1 $display("A  at time:%0t",$time);  
     
        #2 $display("B  at time:%0t",$time); 
      join_any
      $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:1
C  at time:1
B  at time:2
*/

module tb;
  initial
    begin
      fork  
    
        #1 $display("A  at time:%0t",$time);  
     
        #2 $display("B  at time:%0t",$time);  //note that although B and C completes parallelly at same time but the preference is still inside fork block
      join_any
      #1 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:1
B  at time:2
C  at time:2
*/
module tb;
  initial
    begin
      fork  
        #1 $display("A  at time:%0t",$time);  
     
        #2 $display("B  at time:%0t",$time);    
      join_any
      #2 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:1
B  at time:2
C  at time:3
*/

//with #0 delay
module tb;
  initial
    begin
      fork  
    
        #1 $display("A  at time:%0t",$time);  
     
        #2 $display("B  at time:%0t",$time); 
      join_any
      #0 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:1
C  at time:1
B  at time:2
*/

module tb;
  initial
    begin
      fork  
    
        #0 $display("A  at time:%0t",$time);  
     
        #2 $display("B  at time:%0t",$time); 
      join_any
       $display("C  at time:%0t",$time);
    end
  
endmodule

/*
A  at time:0
C  at time:0
B  at time:2
*/
module tb;
  initial
    begin
      fork  
    
        #0 $display("A  at time:%0t",$time);  
     
        #0 $display("B  at time:%0t",$time); 
      join_any
        $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:0
C  at time:0
B  at time:0
*/

//If you want to make fork-join_any to work as fork-join then you can use #0 in every threads(incase of some exceptional case when there is no delay.
module tb;
  initial
    begin
      fork  
    
        #0 $display("A  at time:%0t",$time);  
     
        #0 $display("B  at time:%0t",$time);   //remember No delay come before the #0 delay
      join_any
        #0 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:0
B  at time:0
C  at time:0
*/

module tb;
  initial
    begin
      fork  
    
         $display("A  at time:%0t",$time);  
     
        $display("B  at time:%0t",$time); //No-delay comes before #0 delay. Means when B & C running parallelly after A completed then, B completes first before #0 delay(in inactive region)
      join_any
        #0 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:0
B  at time:0
C  at time:0
*/

module tb;
  initial
    begin
      fork  
    
        #0 $display("A  at time:%0t",$time);  
     
         $display("B  at time:%0t",$time); 
      join_any
        #0 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
B  at time:0
A  at time:0
C  at time:0
*/

module tb;
  initial
    begin
      fork  
    
         #0 $display("A  at time:%0t",$time);  
     
         $display("B  at time:%0t",$time); 
      join_any
       #1 $display("C  at time:%0t",$time);
    end
  
endmodule
/*
B  at time:0
A  at time:0
C  at time:1
*/


module tb;
  initial
    begin
      fork  
    
         #0 $display("A  at time:%0t",$time);  
     
         $display("B  at time:%0t",$time); 
      join_any
         $display("C  at time:%0t",$time);
    end
  
endmodule
/*
B  at time:0
C  at time:0
A  at time:0
*/

module tb;
  initial
    begin
      fork  
    
         $display("A  at time:%0t",$time);  
     
         #0 $display("B  at time:%0t",$time); 
      join_any
         $display("C  at time:%0t",$time);
    end
  
endmodule
/*
A  at time:0
C  at time:0
B  at time:0
*/

