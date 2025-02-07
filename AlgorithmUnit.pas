﻿unit AlgorithmUnit;

interface

type
  Point = record
    x: integer;
    y: integer;
    
    constructor Create(xx, yy : integer);
    begin
      x := xx;
      y := yy;
    end;
  end;
  intArray = array of integer;
  Grid = array of array of integer;
  
  Action = procedure;
  ActionInt = procedure(data: integer);
  
  Algorithm = class
    protected
      //Массивы
      _grid: Grid;
      _gridSize: integer;
      //События
      _onStep: Action;
      _onFinish: Action;
      //Точки начала и конца
      _start : Point;
      _end : Point;
      //Вспомогательные функции
      function Distance(x1, y1, x2, y2 : integer) : integer;
      function IsWalkable(x, y : integer) : boolean;
    public
      //Конструктор
      constructor Create(gridSize: integer; start, finish : Point);
      begin
        _gridSize := gridSize;
        _start := start;
        _end := finish;
        
        _grid := new intArray[_gridSize];
        for var i := 0 to _gridSize - 1 do
          _grid[i] := new integer[_gridSize];
      end;
      
      //Поля
      property GridData: Grid read _grid write _grid;
      
      //События
      property OnStep: Action read _onStep write _onStep;
      property OnFinish: Action read _onFinish write _onFinish;
      
      
      procedure Step(); virtual;
      procedure Restart(); virtual;
      
      function GetPathLength() : integer; virtual;
      function GetGridLayout() : Grid; virtual;
    end;

implementation

  procedure Algorithm.Step();
  begin
  end;
  
  function Algorithm.GetGridLayout() : Grid;
  begin
    var temp := new intArray[_gridSize];
    for var i := 0 to _gridSize - 1 do
      temp[i] := new integer[_gridSize];
    GetGridLayout := temp;
  end;
  
  function Algorithm.IsWalkable(x, y : integer) : boolean;
  begin
    if(x < 0) or (x > _gridSize-1) or (y < 0) or (y > _gridSize-1) then
      IsWalkable := false
    else if(_grid[x][y] = 1) then
      IsWalkable := false
    else
      IsWalkable := true;
  end;
  
  function Algorithm.Distance(x1, y1, x2, y2 : integer) : integer;
  begin
    var xDist := abs(x2 - x1);
    var yDist := abs(y2 - y1);
    var diagonalMove := min(xDist, yDist);
    var straightMove := max(xDist, yDist) - diagonalMove;
    Distance := straightMove * 10 + diagonalMove * 14;
  end;

  procedure Algorithm.Restart();
  begin
    _grid := new intArray[_gridSize];
    for var i := 0 to _gridSize - 1 do
      _grid[i] := new integer[_gridSize];
  end;
  
  function Algorithm.GetPathLength() : integer;
  begin
    GetPathLength := 0;
  end;
end.