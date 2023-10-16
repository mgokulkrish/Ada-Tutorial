with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure main is
    -- defining heap structure
    type Vector is array(1 .. 14) of Integer;
    type Heap is
    record
        Heap_Size: Integer;
        A: Vector;
    end record;

    Hp : Heap;
    -- procedure for heapify
    procedure Max_Heapify(Hp: in out Heap; Index: in Integer) is
        Left : Integer := 2*Index;
        Right : Integer := 2*Index + 1;
        Largest: Integer;
        Temp : Integer;
    begin
        --  Put(Index); Put(Left); Put(Right);
        --  Put_Line("");
        if Left <= Hp.Heap_Size and then Hp.A(Index) < Hp.A(Left) then
            Largest := Left;
        else
            Largest := Index;
        end if;

        if Right <= Hp.Heap_Size and then Hp.A(Largest) < Hp.A(Right) then
            Largest := Right;
        end if;

        if Largest /= Index then
            Temp := Hp.A(Index);
            Hp.A(Index) := Hp.A(Largest);
            Hp.A(Largest) := Temp;
            Max_Heapify(Hp, Largest);
        end if;
    end Max_Heapify;

    procedure Buid_Heap(Hp: in out Heap) is
    begin
        for i in reverse 1 .. Hp.Heap_Size/2 loop
            Max_Heapify(Hp, i);
        end loop;
    end Buid_Heap;
begin
    Hp.A := (27, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0);
    Hp.Heap_Size := 14;
    Buid_Heap(Hp);

    Ada.Integer_Text_IO.Default_Width := 4;
    for j in 1 .. Hp.Heap_Size loop
        Put(Hp.A(j));
    end loop;

end main;