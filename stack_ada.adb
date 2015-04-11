--Iterative implementation of the Ackermann Function
--uses stack.adb and stack.ads

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with stack; use stack;

procedure stack_ada is
--
procedure ackermann (m: in integer, n: in integer, r: out integer) is
push(m);

end ackermann;
--
begin
    r : integer;
    m : integer;
    n : integer;
    put_line("Enter m and n");
    get(m);
    get(n);
    r = ackermann(m,n,r);
    put_line("Result = ");
    put(r);
    new_line;
--need to put in the time tracker
end stack_ada;