package MatrixMult is
    SIZE: Integer := 10;
    type matrix is array(1..SIZE, 1..SIZE) of Integer;
    procedure MatMult(A: in matrix; B: in matrix; C : in out matrix);
end MatrixMult;