with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
 
procedure Compute is

procedure Double(Item : in out Integer) is
begin
	Item := Item * 2;
end Double;

X : Integer := 1;

begin
	loop
		Put(X);
		New_Line;
		Double(X);
	end loop;
end Compute;
