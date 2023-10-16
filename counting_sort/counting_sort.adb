with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure counting_sort is
    SIZE: Integer := 8;
    A: array(1..SIZE) of Integer;
    B: array(1..SIZE) of Integer;
    C: array(0..SIZE) of Integer;
begin
    A:= (2, 5, 3, 0, 2, 3, 0, 3);
    for i in 1..SIZE loop
        C(i) := 0;
    end loop;

    for i in 1..SIZE loop
        C(A(i)) := C(A(i)) + 1;
    end loop;

    for i in 1..SIZE loop
        C(i) := C(i) + C(i-1);
    end loop;

    for i in reverse 1..SIZE loop
       B(C(A(i))) := A(i);
       C(A(i)) := C(A(i)) - 1;
    end loop;

    for i in 1..SIZE loop
        Put(B(i));
    end loop;
    
end counting_sort;