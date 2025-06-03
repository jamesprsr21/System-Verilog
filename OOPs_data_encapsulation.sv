//Protecting the data access from outside of class
Types:  PUBLIC  //By default all property and methods are public
        LOCAL  //Local to the particular class
        PROTECTED //can access outside of the class only in the derived class(child class/extended class) only.
//Local and Protected variables can't access withing module initial block also

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class parent;
  local logic [1:0]a;
  protected logic [1:0]b;

  protected function void display();
    $display("a=%0d,b=%0d",a,b);
  endfunction
  
  function void update(logic [1:0]a,b);
  this.a=a;
  this.b=a;
  endfunction
  
endclass:parent

class child extends parent;
  logic [1:0]c;
  function void calc();
    super.display();  //Protected methods of parent can be accessed by child
    super.a=2;   //Error! ..local variables of parent class can't be accessed by child
    super.b=1;  //Proteceted variables of parent can be accessed by child class
  endfunction
endclass

module test();
initial 
  begin
  parent ph;
    child ch;
    ph=new();
    ph.a=2; //Error! ..local and protected variables/methods can't be accessed outside of the class
    ph.b=2; //Error!
    ph.update(1,2);
    ch=new();
    ch.update(2,3);
    ch.display();
    ch.calc();
  end 
endmodule 


  
