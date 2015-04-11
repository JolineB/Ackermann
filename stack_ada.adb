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
type proc_access is access procedure(X:in out integer);
start: Time;
finish: Time;
func_arg: integer:= Arg;
r : integer;
m : integer;
n : integer;
--
function time_it(Action: Proc_Access; Arg: Integer) return Duration is
start: Time := Clock;
finish: Time;
func_arg: integer:=Arg;
check: Boolean;
begin
    Action(func_arg);
    finish := Clock;
    return finish - start;
end time_it;
procedure ackermann (m: in integer; n: in out integer) is
begin
push(m);
loop
    if(stack_is_empty() = .true.) then
        exit;
    end if;
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
ackermann_Access : Proc_Access := ackermann'access;
--
begin
    put_line("Enter m and n");
    get(m);
    get(n);
    r := ackermann(m,n);
    put_line("Result: " & r);
    put_line(Duration'Image(time_it(ackermann_Access,m,n)) & "miliseconds");
--need to put in the time tracker
end stack_ada;

