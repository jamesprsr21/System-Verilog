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
      $display("%0p",g);
      $display("return from the function is %0p",g.fn(g.a,g.b)); //don't forget to give the scope of the class handle while using the properties or methods outside of the class.Otherwise it will through an error like variable not declared
    end
endmodule 
