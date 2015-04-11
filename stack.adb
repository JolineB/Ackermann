--Contents of stack.ads:
--    procedure push(x: in integer);
--    procedure pop(x: out integer);
--    function stack_is_empty return Boolean;
--    function stack_top return integer;
--    procedure reset_stack;
--    function getStackItem(x: in integer) return integer;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with ada.numerics.elementary_functions; use ada.numerics.elementary_functions;
with Ada.Text_IO; use Ada.Text_IO;

package body stack is
	type stackArray is array(1 .. 50) of integer;
	type q_stack is
		record
			item : stackArray; --array of 50 integers
			top : integer := 0; --Always the top of the stack
		end record;
    st : q_stack;
    --
    procedure push(x : in integer) is
    begin
        if st.top = 50 then
            put_line("stack is full");
        else
            st.top := st.top + 1;
            st.item(st.top) := x;
        end if;
    end push;
    --
    procedure pop(x : out integer) is
    begin
        if st.top = 0 then
            put_line("Stack is empty");
        else
            x := st.item(st.top);
            st.top := st.top -1;
        end if;
    end pop;
    --
    function stack_is_empty return Boolean is
    begin
        return st.top = 0;
    end stack_is_empty;
    --
    function stack_top return integer is
    begin
        if st.top = 0 then
            put_line("Stack is empty");
            return 0;
        else
            return st.item(st.top);
        end if;
    end stack_top;
    --
    procedure reset_stack is
    begin
        st.top := 0;
    end reset_stack;
end stack;
    