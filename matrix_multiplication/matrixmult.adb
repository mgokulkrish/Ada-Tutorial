with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body MatrixMult is
    procedure MatMult(A: in matrix; B: in matrix; C: in out matrix) is
        task type T is
            entry Start(x: Integer; y: Integer; A : in matrix; B: in matrix);
        end T;
        task body T is
            A_mat : matrix;
            B_mat : matrix;
            i : Integer;
            j : Integer;
        begin
            accept Start(x: Integer; y: Integer; A : in matrix; B: in matrix) do
                i:=x;
                j:=y;
                A_mat := A;
                B_mat := B;
            end Start;
            for k in 1..SIZE loop
                --  Put(i*SIZE + j);
                C(i,j) := C(i,j) + (A_mat(i,k) * B_mat(k, j)); 
            end loop;
        end T;
        tasks: array(1..SIZE, 1..SIZE) of T;
    begin
        for i in 1..SIZE loop
            for j in 1..SIZE loop
                tasks(i,j).Start(i, j, A, B);
            end loop;
        end loop;
    end MatMult;

end MatrixMult;