Unit Unit2;

interface

uses GraphWPF;

implementation

procedure ColorCell(x,y: real; mb: integer);
begin 
  if mb = 1 then FillRectangle(trunc(x), trunc(y), 0.97, 0.97, RGB(0,0,0));
end;

begin
  Window.Caption := 'Визуализация алгоритмов поиска кратчайшего пути';
  SetMathematicCoords(0, 20, 0, true);
  OnMouseDown := ColorCell;
  OnMouseMove := ColorCell;
end.