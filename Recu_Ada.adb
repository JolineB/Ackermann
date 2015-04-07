with Ada.Text_IO; use Ada.Text_IO;
with ada_Integer_Text_IO; use ada_Integer_Text_IO;

procedure Recu_Ada is
	function Ackermann (M, N: Natural) return Natural is
	begin
		if M = 0 then
			return N + 1;
		elseif N = 0 then
			return Ackermann (M - 1, 1);
		else 
			return Ackermann (M - 1, Ackermann(M, N-1));
		end if;
	end Ackermann;

begin
	for M in 0..3 loop
		for N in 0..6 loop
			Put(M);
			Put(N);
			Put(": ");
			Put(Natural'Image (Ackermann(M, N)));
			New_Line;
		end loop;
		New_Line;
	end loop; 
end Recu_Ada;
