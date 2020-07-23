unit StateMachineUnit;

interface
  uses AlgorithmUnit, AStarUnit, ВFSUnit;

  type     
    StateMachine = class
      private 
        _tick : integer;
        _speed : integer;
        _gridSize : integer;
        _grid : Grid;
        _isPlaying : boolean;
        _onGridChange : Action;
        _onComplete : Action;
        _onStart : Action;
        _onSpeedChange : ActionInt;
        _start : Point;
        _end : Point;
        _algorithmNumber : integer;
        _algorithm : Algorithm;
        
        _openCells : integer;
        _closedCells : integer;
        _pathLength : integer;
        
        procedure CreateGrid();
        procedure OnAlgorithmStep();
        procedure OnAlgorithmFinish();
      public
        //Конструктор
        constructor(gridSize : integer);
        begin
          _tick := 0;
          _speed := 2;
          _gridSize := gridSize;
          CreateGrid();      
          ChangeAlgorithm(1);
        end;
        
        //Поля
        property GridData : Grid read _grid;
        property IsPlaying : boolean read _isPlaying write _isPlaying;
        property OpenCells : integer read _openCells;
        property ClosedCells : integer read _closedCells;
        property PathLength : integer read _pathLength;
        
        //События
        property OnGridChange : Action read _onGridChange write _onGridChange;
        property OnComplete : Action read _onComplete write _onComplete;
        property OnStart : Action read _onStart write _onStart;
        property OnSpeedChange : ActionInt read _onSpeedChange write _onSpeedChange;
        
        //Методы
        procedure SetCellType(celltype : integer; x : integer; y : integer);
        procedure SetSpeed(speed : integer);
        procedure ChangeSize(size : integer);
        procedure MainLoop();
        procedure ClearGrid();
        procedure Act();
        procedure ChangeAlgorithm(num : integer);
        procedure ClearAlgorithmLayout();
         
    end;
  
implementation
  procedure StateMachine.SetSpeed(speed : integer);
    begin
      if(speed < 1) then _speed := 1
      else if(speed > 3) then _speed := 3
      else _speed := speed;
      _speed := 4 - _speed;
      if(_onSpeedChange <> nil) then
        _onSpeedChange(_speed);
    end;
  
  procedure StateMachine.SetCellType(celltype : integer; x : integer; y : integer);
    begin
      if IsPlaying then exit;
      
      if (x >= 0) or (x <= _gridSize) then
        if (y >= 0) or (y <= _gridSize) then
        begin
          if(_grid[x][y] <> celltype) and (_grid[x][y] <> 5) and (_grid[x][y] <> 6) then
          begin
            _grid[x][y] := celltype;
            if(celltype = 5) then 
              begin 
                _grid[_start.x][_start.y] := 0;
                _start.x := x;
                _start.y := y;
                ChangeAlgorithm(_algorithmNumber);
              end;
            if(celltype = 6) then
              begin 
                _grid[_end.x][_end.y] := 0;
                _end.x := x;
                _end.y := y;
                ChangeAlgorithm(_algorithmNumber);
              end;
            if(_onGridChange <> nil) then
              _onGridChange();
          end;
        end;
    end;
  
  procedure StateMachine.CreateGrid();
  begin
      if IsPlaying then exit;
    
      _grid := new intArray[_gridSize];
      for var i := 0 to _gridSize-1 do
        _grid[i] := new integer[_gridSize];
      
      _start.x := 4;
      _start.y := 4;
      _grid[4][4] := 5;
      
      _end.x := 15;
      _end.y := 15;
      _grid[15][15] := 6;
      
      if(_onGridChange <> nil) then
        _onGridChange();
  end;
  
  procedure StateMachine.ChangeSize(size : integer);
    begin
      if(size < 2) then _gridSize := 2
      else if(size > 100) then _gridSize := 100
      else _gridSize := size;
      
      CreateGrid();
    end;
    
  procedure StateMachine.MainLoop();
    begin
      if(_isPlaying) then begin
        _tick += 1;
        if(_tick mod (_speed * _speed * _speed) = 0) then
        begin
          _tick := 0;
          //DO STAFF
          Act();
          if(_onGridChange <> nil) then
            _onGridChange();
        end;
      end;
    end;
  
  procedure StateMachine.ClearGrid();
    var tempStart, tempEnd : Point;
    begin
      tempStart := _start;
      tempEnd := _end;
      CreateGrid();
      _grid[_start.x][_start.y] := 0;
      _start := tempStart;
      _grid[_start.x][_start.y] := 5;
      
      _grid[_end.x][_end.y] := 0;
      _end := tempEnd;
      _grid[_end.x][_end.y] := 6;
      ChangeAlgorithm(_algorithmNumber);
    end;
    
  procedure StateMachine.Act();
    begin
      _algorithm.Step();
    end;
    
  procedure StateMachine.OnAlgorithmStep();
  begin
    var algorithmLayout := _algorithm.GetGridLayout();
      for var x:=0 to _gridSize-1 do
        for var y:=0 to _gridSize-1 do
          if(_grid[x][y] <> 1) and (_grid[x][y] <> 5) and (_grid[x][y] <> 6)then
            _grid[x][y] := algorithmLayout[x][y];
      
      if(_onGridChange <> nil) then
        _onGridChange();
  end;
    
  procedure StateMachine.OnAlgorithmFinish();
  begin
    _openCells := 0;
    _closedCells := 0;
    _pathLength := _algorithm.GetPathLength();
    
    
    for var x:=0 to _gridSize-1 do
        for var y:=0 to _gridSize-1 do
          begin
            if(_grid[x][y] = 2) or (_grid[x][y] = 4) or (_grid[x][y] = 6) then _closedCells += 1;
            if(_grid[x][y] = 3)then _openCells += 1;
          end;
          
    ChangeAlgorithm(_algorithmNumber);
    _isPlaying := false;
    if(_onComplete <> nil)then
      _onComplete();
  end;
  
  procedure StateMachine.ChangeAlgorithm(num : integer);
  begin
    _algorithmNumber := num;
    case num of
      1: _algorithm := new AStar(_gridSize, _start, _end);
      2: _algorithm := new BFS(_gridSize, _start, _end);
    end;
    _algorithm.GridData := _grid;
    _algorithm.OnStep += OnAlgorithmStep;
    _algorithm.OnFinish += OnAlgorithmFinish;
  end;
  
  procedure StateMachine.ClearAlgorithmLayout();
  begin
    ChangeAlgorithm(_algorithmNumber);
  end;
end.
