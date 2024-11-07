class eg;
  rand logic [5:0]a;
  rand logic [5:0]b;
  
  function int fn(input logic [5:0]x,y);  //formal arguments
    return x+y;
  endfunction
  
  constraint c1{a inside {[0:20]};
                b inside {[0:20]};}
  constraint c2{a <=b;}
  
  function void post_randomize();
    $display("BEFORE");
    $display("a=%0d",a);  
    $display("b=%0d",b);
    a=a+1;
    b=b+1;
    $display("AFTER");
    $display("a=%0d",a);
    $display("b=%0d",b);
  endfunction
endclass

module test();
eg g;
  initial 
    begin
      g=new();
      assert(g.randomize());
      g.fn(1,2);  //actual argument eg.
      $display("FINAL: a=%0d \n  b=%0d",g.a, g.b);
      $display("return from the function is %0p",g.fn(g.a,g.b)); //don't forget to give the scope of the class handle while using the properties or methods outside of the class.Otherwise it will through an error like variable not declared
    end
endmodule 
