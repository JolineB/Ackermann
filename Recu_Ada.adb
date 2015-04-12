with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure recu_ada is
	x : integer := 0;
	y : integer := 0;
	function Ackermann (M, N: Natural) return Natural is
	begin
		if M = 0 then
			return N + 1;
		elsif N = 0 then
			return Ackermann (M - 1, 1);
		else 
			return Ackermann (M - 1, Ackermann(M, N-1));
		end if;
	end Ackermann;

begin
	put_line("Enter m and n");
    get(x);
    get(y);
	for M in 0..x loop
		for N in 0..y loop
			Put(M);
			Put(N);
			Put(": ");
			Put(Natural'Image (Ackermann(M, N)));
			New_Line;
		end loop;
		New_Line;
	end loop; 
end recu_ada;
