// Without using modulus to generate even number
class eg;
  rand bit[5:0] a,b;
  //rand  y;
  
//   constraint c1{x inside {[0:10]};
//               y inside {[10:20]};}
  
//   constraint c2{foreach(a[i])
//     if(a[0]==0;
//        a[i];}
  
  function void post_randomize();
    $display("%0d",a);    
    if(a[0]==0) begin  //The number is even number if the LSB bit is 0
      b=a;   //Filter the even number and store it into b variable 
      $display("a= %0d, b= %0d",a,b);
    end
  endfunction
endclass

module test;
 eg g;
  initial
  begin
    g=new();
    repeat(20)  //Randomizing 20 times  
    g.randomize();
  end
endmodule 
  
