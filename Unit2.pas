unit Unit2;

interface

uses GraphWPF, StateMachineUnit;

procedure CreateWindow;

const
  n = 20;

type
(* Объявляем составной тип - класс *)
  Cell = class 
    x,y: integer;(* координаты левого верхнего угла *)
    w: real;  (* длина стороны квадрата *)
    
   (* Конcтруктор класса: *)
    constructor (xx,yy: integer; ww: real);
    begin
      x := xx; y := yy; w := ww;
    end;
    
    (* Метод класса "Рисование клетки" *)
    procedure Stamp;
    begin
      Rectangle(x + 0.04, y + 0.04, w, w); (* рисуем квадрат *)
    end;
  end; //Cell class

var
  celltype: integer;
  r: Cell;
  c: Color;
  machine: StateMachine;

implementation

procedure ColorCell(x, y: real; mb: integer);
begin
  if mb = 1 then  begin
    machine.SetCellType(celltype, trunc(y), trunc(x));
  end;
end;

procedure CreateWindow;
begin
  r := new Cell(0,0,0.92);
  Window.SetSize(700, 700);
  Window.IsFixedSize := true;
  Window.CenterOnScreen;
  Window.Caption := 'Визуализация алгоритмов поиска кратчайшего пути';
  SetMathematicCoords(0, 20, 0, true);
  for var x:=0 to n-1 do begin
    for var y:=0 to n-1 do begin
      case machine.GridData[x,y] of
        0: Brush.Color := RGB(255,255,255);
        1: Brush.Color := RGB(0,0,0);
        5: Brush.Color := RGB(0,255,0);
        6: Brush.Color := RGB(255,0,0);
        //дописать
      end;
      r.Stamp;
      r.x := r.x + round(r.w);
    end;
    r.x := 0;
    r.y := r.y + round(r.w);
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