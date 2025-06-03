//Protecting the data access from outside of class
Types:  PUBLIC  //By default all property and methods are public
        LOCAL  //Local to the particular class
        PROTECTED //can access outside of the class only in the derived class(child class/extended class) only.
//Local and Protected variables can't access withing module initial block also

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class parent;
  local logic [1:0]a; //2bit variables, support only 0-3
  protected logic [1:0]b; //2bit variables, support only 0-3

  protected function void display();
          $display("This is Protected method: a=%0d,b=%0d",a,b);
  endfunction

  local function void monitor();
      $display("This is Local method: a=%0d,b=%0d",a,b);
  endfunction
  
  function void update(logic [1:0]a,b); //public by default
  monitor();
  this.a=a; //assigning argument inputs to the local and protected variables
  this.b=b;  //assigning to protecetd variable
  endfunction
  
endclass:parent

//Child class
class child extends parent;
  logic [1:0]c;
  function void calc();
    super.display();  //Protected methods of parent can be accessed by child
    //super.a=2;   //Error! ..local variables of parent class can't be accessed by child(Local member 'a' of class 'parent' is not visible to scope 'child')
    super.b=3;  //Protected variables of parent can be accessed by child class
  endfunction
endclass

module test();
initial 
  begin
  parent ph;
    child ch;
    ph=new();
    //ph.a=2; //Error! ..local and protected variables/methods can't be accessed outside of the class(Local member 'a' of class 'parent' is not visible to scope 'test')
    //ph.b=2; //Error!(Protected member 'b' of class 'parent' is not visible to scope 'test')
// Q.Then how can we access local and protected variables or methods?
          //this is the way, we can use a public method in the same class where we will be assigning the argument inputs to the local and protected variables
    ph.update(0,0); //indirectly we are assigning values(accessing) to local & protected variable with the help of public method present in the parent class itself
    ch=new();
    ch.update(3,1); //child class also can access parent's method  //supports upto 0-3 value as 2bit variable only
    //ch.display(); //Error!  Protected method 'display' of class 'parent' is not visible to scope 'test
//Q. Then how to access Display method outside of the scope?
          //for that, We can call the protected method in the public method present there, and then we can access the protected method
          ch.calc(); //indirectly accessing protcted method(display) and protected variable using the public method(calc) present in the child class itself
  end 
endmodule


Q. How can you access local and protected varibales and methods outside of it's scope?
Ans: With the help of public method we can access.


  
