with Ada.Text_IO;
use Ada.Text_IO;

procedure StringOperation is
    procedure reverse_string(S: in String) is
    begin
        for I in reverse S'First .. S'Last loop
            Put(S(I));
        end loop;
    end reverse_string;

    Str: String := "A hello";
begin
    reverse_string(Str(3..Str'Last));
end StringOperation;
