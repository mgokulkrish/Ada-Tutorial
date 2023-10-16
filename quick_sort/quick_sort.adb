with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure main is
    type vector is array(1 .. 8) of Integer;
    A : vector := (1, 7, 3, 4, 2, 0, -1, -4);
    p : Integer := 1;
    r : Integer := 8;

    function partition(A: in out vector; 
                    p: in Integer; 
                    r: in Integer) return Integer is 
        i : Integer := p-1; 
        Temp : Integer;
        subtype Random_Range is Integer range p .. r;

        package Rand_Int is new ada.numerics.discrete_random(Random_Range);
        use Rand_Int;
        G : Generator;
        X : Random_Range;

        Index : Integer;
    begin
        Index := random(G);
        Temp := A(Index);
        A(Index) := A(r);
        A(r) := Temp;
        for j in p .. r loop
            if A(j) <= A(r) then
                i := i + 1;
                Temp := A(j);
                A(j) := A(i);
                A(i) := Temp;
            end if;
        end loop;
        return i;
    end partition;

    procedure print_array(A: in vector) is
    begin
        Ada.Integer_Text_IO.Default_Width := 2;
        for j in 1 .. 8 loop
            Put(A(j));
        end loop;
        Put_Line("");
    end print_array;

    procedure quicksort(A: in out vector; p: in Integer; r: in Integer) is
        i: Integer;
    begin
        if p < r then
            i := partition(A, p, r);
            quicksort(A, p, i-1);
            quicksort(A, i+1, r);
        end if;
    end quicksort;

begin
    quicksort(A, p, r);
    print_array(A);
end main;