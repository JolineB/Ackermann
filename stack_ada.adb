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
with Ada.Calendar; use Ada.Calendar;
with stack; use stack;

procedure stack_ada is
-- type Proc_Access is access procedure(X:in out integer);
-- start: Time;
-- finish: Time;
-- func_arg: integer:= Arg;
r : integer;
m : integer;
n : integer;
--
-- function time_it(Action: Proc_Access; Arg: Integer) return Duration is
-- start: Time := Clock;
-- finish: Time;
-- func_arg: integer:=Arg;
-- begin
--     Action(func_arg);
--     finish := Clock;
--     return finish - start;
-- end time_it;
procedure ackermann (m: in integer; n: in integer; r: out integer) is
check: Boolean;
op : integer:= m;
begin
push(op);
loop
    check := stack_is_empty();
    if(check) then
        exit;
    end if;
    r := n;
    pop(op);
    if op = 0 then
        r:= r + 1;
    elsif r = 0 then
        r:= 1;
        push (op - 1);
    else
        r := r - 1;
        push(op-1);
        push(op);
    end if;
end loop;
put(r);
new_line;
end ackermann;
--ackermann_Access : Proc_Access := ackermann'access;
--
begin
    put_line("Enter m and n");
    get(m);
    get(n);
    ackermann(m,n, r);
    put_line("Result: ");
    put(r);
    new_line;
    --put_line(Duration'Image(time_it(ackermann_Access,m,n)) & "miliseconds");
--need to put in the time tracker
end stack_ada;

