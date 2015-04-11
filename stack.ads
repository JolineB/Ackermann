package stack is
	procedure push(x: in integer);
	procedure pop(x: out integer);
	function stack_is_empty return Boolean;
	function stack_top return integer;
	procedure reset_stack;
	--function getStackItem(x: in integer) return integer;
end stack;
