with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

with MatrixMult;
use MatrixMult;

procedure AssignmentMain is
    -- A x B = C
    A : matrix;
    B : matrix;
    C : matrix := (others => (others => 0));

    task Reader1 is 
        entry Start;
    end Reader1;

    task body Reader1 is
    begin
        accept Start do
            for i in 1..SIZE loop
                for j in 1..SIZE loop
                    Get(A(i,j));
                end loop;
            end loop;
        end Start;
    end Reader1;

    task Reader2 is 
        entry Start;
    end Reader2;

    task body Reader2 is
    begin
        accept Start do
            for i in 1..SIZE loop
                for j in 1..SIZE loop
                    Get(B(i,j));
                end loop;
            end loop;
        end Start;
    end Reader2;

    task Printer is 
        entry Start;
    end Printer;

    task body Printer is
    begin
        accept Start do
            Ada.Integer_Text_IO.Default_Width := 8;
            for i in 1..SIZE loop
                for j in 1..SIZE loop
                    Put(C(i,j));
                end loop;
                Put_Line("");
            end loop;
        end Start;
    end Printer;
begin

    Reader1.Start;
    Reader2.Start;
    MatMult(A, B, C);
    Printer.Start;

end AssignmentMain;