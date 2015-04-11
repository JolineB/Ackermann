--Iterative implementation of the Ackermann Function
--uses stack.adb and stack.ads
--Contents of stack.ads/adb:
--    procedure push(x: in integer);
--    procedure pop(x: out integer);
--    function stack_is_empty return Boolean;
--    function stack_top return integer;
--    procedure reset_stack;
--    function getStackItem(x: in integer) return integer;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with stack; use stack;

procedure stack_ada is
--
procedure ackermann (m: in integer, n: in out integer) is
push(m);
while not stack_is_empty() loop
    pop(m);
    if m = 0 then
        n := n + 1;
    elsif n = 0 then
        n := 1;
        push (m-1);
    else
        n := n - 1;
        push(m-1);
        push(m);
    end if;
end loop;
end ackermann;
--
begin
    r : integer;
    m : integer;
    n : integer;
    put_line("Enter m and n");
    get(m);
    get(n);
    r = ackermann(m,n);
    put_line("Result = ");
    put(r);
    new_line;
--need to put in the time tracker
end stack_ada;