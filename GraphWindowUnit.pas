Unit GraphWindowUnit;

interface

uses GraphWPF, StateMachineUnit;

procedure CreateWindow;

const
  n = 20;
  
var
  celltype: integer;
  c: Color;
  machine: StateMachine;
  canEdit: boolean;

implementation

procedure ColorCell(x, y: real; mb: integer);
begin
  if (mb = 1)and(canEdit = true) then  begin
    machine.ClearAlgorithmLayout();
    machine.SetCellType(celltype, trunc(x), trunc(y));
  end;
end;

procedure DrawGrid;
begin
  SetMathematicCoords(0, 20, 0, true);
  for var x:=0 to n-1 do
    for var y:=0 to n-1 do begin
      case machine.GridData[x,y] of
        0: Brush.Color := Colors.White;   // пустая
        1: Brush.Color := Colors.Black;   // преграда
        2: Brush.Color := Colors.Gray;    // помеченная
        3: Brush.Color := Colors.SkyBlue; // в очереди
        4: Brush.Color := Colors.Yellow;  // путь
        5: Brush.Color := Colors.Green;   // начало
        6: Brush.Color := Colors.Red;     // конец
      end;
      Rectangle(x + 0.04, y + 0.04, 0.92, 0.92); (* рисуем клетку *)
    end;
end;

procedure CreateWindow;
begin
  Window.SetSize(700, 700);
  Window.CenterOnScreen;
  Window.IsFixedSize := true;
  Window.Caption := 'Визуализация алгоритмов поиска кратчайшего пути';
  SetMathematicCoords(0, 20, 0, true);
  DrawGrid;
end;

procedure Animation;
begin
  BeginFrameBasedAnimation(DrawGrid, 30);
end;

begin
  canEdit := true;
  machine := new StateMachine(20);
  machine.OnGridChange := Animation;
  Pen.Color := Colors.White;
  CreateWindow;
  OnMouseDown := ColorCell;
  OnMouseMove := ColorCell;
end.