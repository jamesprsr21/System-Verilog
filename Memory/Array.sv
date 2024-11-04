class Array;
  reg [3:0]var[7:0];
  function new(input [3:0]varr);
    var=varr;
    varr++;
  endfunction
endclass

module test();
Array a;
  reg [3:0]x;
  initial
    begin
      a=new();
      x='d7;
      a.new(x);
      $display("%0d",a.var);
    end
endmodule
  
