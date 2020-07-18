Unit Unit2;

interface

uses GraphWPF;
var
  c: Color;

implementation

procedure ColorCell(x,y: real; mb: integer);
begin 
  if mb = 1 then  begin
    Rectangle(trunc(x)+0.04, trunc(y)+0.04, 0.92, 0.92, c);
  end;
end;

begin
  Window.SetSize(700,700);
  Window.IsFixedSize := true;
  Window.CenterOnScreen;
  Window.Caption := 'Визуализация алгоритмов поиска кратчайшего пути';
  SetMathematicCoords(0, 20, 0, true);
  Pen.Color := RGB(255,255,255);
  OnMouseDown := ColorCell;
  OnMouseMove := ColorCell;
end.