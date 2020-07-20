﻿unit Unit2;

interface

uses GraphWPF, StateMachineUnit;

procedure CreateWindow;

const
  n = 20;
  
var
  celltype: integer;
  c: Color;
  machine: StateMachine;

implementation

procedure ColorCell(x, y: real; mb: integer);
begin
  if mb = 1 then  begin
    machine.SetCellType(celltype, trunc(x), trunc(y));
  end;
end;

procedure CreateWindow;
var
  w: real;
begin
  w := 0.92;
  Window.SetSize(700, 700);
  Window.IsFixedSize := true;
  Window.CenterOnScreen;
  Window.Caption := 'Визуализация алгоритмов поиска кратчайшего пути';
  SetMathematicCoords(0, 20, 0, true);
  for var x:=0 to n-1 do
    for var y:=0 to n-1 do begin
      case machine.GridData[x,y] of
        0: Brush.Color := RGB(255,255,255);
        1: Brush.Color := RGB(0,0,0);
        //дописать
        5: Brush.Color := RGB(0,255,0);
        6: Brush.Color := RGB(255,0,0);
      end;
      Rectangle(x + 0.04, y + 0.04, w, w); (* рисуем клетку *)
    end;
end;

begin
  machine := new StateMachine(20);
  machine.OnGridChange := CreateWindow;
  Pen.Color := RGB(255,255,255);
  CreateWindow;
  OnMouseDown := ColorCell;
  OnMouseMove := ColorCell;
end.