//////////fork-join_any to fork_join ///////////////////////////////////
module tb;
  initial
    begin
 
      fork
     
        #1 $display("A");

        #2 $display("B");
    
      join_any
    wait fork;  //waits until all the fork process completes the execution
       $display("C");
    end
  
endmodule

/*

Output:
A
B
C

*/
