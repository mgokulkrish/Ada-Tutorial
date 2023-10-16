with Ada.Text_IO;
use Ada.Text_IO;

procedure file_writer is
    New_File: File_Type;
begin
    Create(New_File, Out_File, "hi.txt");
    Put_Line(New_File, "Hi, this is test");
    Close(New_File);
end file_writer;