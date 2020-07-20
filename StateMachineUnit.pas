unit StateMachineUnit;

interface
  type 
    Point = record
      x : integer;
      y : integer;
    end;
    intArray = array of integer;
    Grid = array of array of integer;
    
    Action = procedure;
    ActionInt = procedure(data : integer);
    
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
        
        procedure CreateGrid();
      public
        //Конструктор
        constructor(gridSize : integer);
        begin
          _tick := 0;
          _speed := 2;
          _gridSize := gridSize;
          CreateGrid();
        end;
        
        //Поля
        property GridData : Grid read _grid;
        property IsPlaying : boolean read _isPlaying write _isPlaying;
        
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
         
    end;
  
implementation
  procedure StateMachine.SetSpeed(speed : integer);
    begin
      if(speed < 1) then _speed := 1
      else if(speed > 3) then _speed := 3
      else _speed := speed;
      if(_onSpeedChange <> nil) then
        _onSpeedChange(_speed);
    end;
  
  procedure StateMachine.SetCellType(celltype : integer; x : integer; y : integer);
    begin
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
              end;
            if(celltype = 6) then
              begin 
                _grid[_end.x][_end.y] := 0;
                _end.x := x;
                _end.y := y;
              end;
            if(_onGridChange <> nil) then
              _onGridChange();
          end;
        end;
    end;
  
  procedure StateMachine.CreateGrid();
  begin
      _grid := new intArray[_gridSize];
      for var i := 0 to _gridSize-1 do
        _grid[i] := new integer[_gridSize];
      
      _start.x := 0;
      _start.y := 0;
      _grid[0][0] := 5;
      
      _end.x := 1;
      _end.y := 0;
      _grid[1][0] := 6;
      
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
          //Act();
          
          _grid[1][1 + _tick] := 1;
          _grid[1][1 + 1 - _tick] := 0;
          if(_onGridChange <> nil) then
            _onGridChange();
        end;
      end;
    end;
  
  procedure StateMachine.ClearGrid();
    begin
      CreateGrid();
    end;
    
  procedure StateMachine.Act();
    begin
      //ACT STAFF  
    end;
end.
