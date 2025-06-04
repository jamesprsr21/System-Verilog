//Static properties
class packet;
int a;  //dynamic in nature, separate memory will be allocated for each handle for the variable a
endclass

module test;
packet p1,p2;
  
  initial
    begin
      p1=new();
      p2=new();
      p1.a=10;
      p2.a=20;
      $display("p1.a=%0d & p2.a=%0d",p1.a,p2.a);
    end
endmodule
//output:p1.a=10 & p2.a=20
///////////////////////////////////////////////////////////
class packet;
static int a; //static in nature, So shared between handle p1 and p2.The varuable will get overriden by latest update value 
endclass

module test;
packet p1,p2;
  
  initial
    begin
      p1=new();
      p2=new();
      p1.a=10;
      p2.a=20;
      $display("p1.a=%0d & p2.a=%0d",p1.a,p2.a);
    end
endmodule
//output: p1.a=20 & p2.a=20
//////////////////////////////////////////////////////////////
//Global constant properties
//it is not possible to change  const variable. 
//but you can assign the const value in two way. Either by directly assigning value at the compilation time or assign using function new constructor.

module test();
class trans;
  //const int a; 
  const int a;  //you can assign value to a const variable directly
  
  function new(input int b); //using only function new constructor we can modifyy the variable
  this.a=b;
  endfunction
  
endclass
  trans t1;
  initial begin
    t1=new(10);  //assiging value in run_time using function new constructor
    //t1.a=20;  //will give Error
    $display("a=%0d",t1.a);
  end
endmodule

////////////////////////////////////////////////////////////////////////////
//Static Method:
/*
1. static function:Local variable declared inside is Dynamic in nature.
  					It can access only static properties.
 2.function static: Local variable declared inside is Static in nature.
   					It can access both static and dynamic properties
   3. static function static:Local variable declared inside is Static in nature.
					It can access only static properties.
                    */

module test;
class trans;
  static int i;
  int j; //dynamic 
  static function void stat_fun();
    int b; //variable declared inside static function is Dynamic in nature
    i++; //accessing static variable  
    b++; //so dynamically memory allocated, so there is separate memory creation
    //j++; //ERROR!   Illegal access of non-static member 'j' from static method 
    $display("stat_fun, i=%0d,b=%0d",i,b);
  endfunction
  
  function static void fun_stat();
  int a;  //declared variable is static in nature 
    j++; //accessing dynamic variable
    a++; //local static variable
    i++; //can access dynamic variable also
    $display("fun_stat,i=%0d, j=%0d,a=%0d",i,j,a);
  endfunction
  
 static function static void stat_fun_stat();
  int c; //declared variable static in nature 
    i++; //can access only static variable 
    //j++; //ERROR!   Illegal access of non-static member 'j' from static method 
    c++; 
   $display("stat_fun_stat, i=%0d,c=%0d",i,c);
  endfunction
  
endclass
  

  
  trans t[];
  initial
    begin
      t=new[5];
      foreach(t[i])
        begin
          t[i]=new();
          t[i].stat_fun();
        end
      foreach(t[i])
        begin
          t[i].fun_stat();
        end
      foreach(t[i])
        begin
          t[i].stat_fun_stat();
        end
    end
  
endmodule 
