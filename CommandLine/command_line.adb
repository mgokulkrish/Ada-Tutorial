with Ada.Text_IO, Ada.Command_Line, Ada.Strings.Unbounded;
use Ada.Text_IO, Ada.Command_Line, Ada.Strings.Unbounded;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Show is
    procedure Show_File(Filename: String) is
        File: File_Type;
        Input: Unbounded_String;
    begin
        Put("Printing file : ");
        Put_Line(Filename);

        Open(File, In_File, Filename);
        while (not End_Of_File(File)) loop
            Input := To_Unbounded_String(Get_Line(File));
            Put(' ');
            Put_Line(to_string(Input));
        end loop;
        Close(File);

    end Show_File;
begin
    if Argument_Count = 0 then
        Put_Line(Current_Error, "no filename given");
        Set_Exit_Status(Failure);
    else
        Put("number of files:");
        Put(Argument_Count);
        Put_Line("");
        for Arg in 1 .. Argument_Count loop
            Show_File(Argument(Arg));
        end loop;
    end if;
end Show;