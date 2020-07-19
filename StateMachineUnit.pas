unit StateMachineUnit;

interface
  type 
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
        
        procedure Act();
      public
        //Конструктор
        constructor(gridSize : integer);
        begin
          _gridSize := gridSize;
          _grid := new intArray[_gridSize];
          for var i := 1 to _gridSize do
            _grid[i] := new integer[_gridSize];
        end;
        
        //Поля
        property Grid : Grid read _grid;
        
        //События
        property OnGridChange : Action read _onGridChange write _onGridChange;
        property OnComplete : Action read _onComplete write _onComplete;
        property OnStart : Action read _onStart write _onStart;
        property OnSpeedChange : ActionInt read _onSpeedChange write _onSpeedChange;
        
        //Методы
        procedure SetCellType(type : integer; x : integer; y : integer);
        procedure SetSpeed(speed : integer);
        procedure ChangeSize(size : integer);
        procedure MainLoop();
         
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
  
  procedure StateMachine.SetCellType(type : integer; x : integer; y : integer);
    begin
      if (x >= 0) or (x <= _gridSize) then
        if (y >= 0) or (y <= _gridSize) then
        begin
          if(_grid[x][y] <> type) then
          begin
            _grid[x][y] = type;
            if(_onGridChange <> nil) then
              _onGridChange();
          end;
        end;
    end;
  
  procedure StateMachine.ChangeSize(size : integer);
    begin
      if(size < 2) then _gridSize := 2
      else if(size > 100) then _gridSize := 100
      else _gridSize := size;
      
      _gridSize := size;
          _grid := new intArray[_gridSize];
          for var i := 1 to _gridSize do
            _grid[i] := new integer[_gridSize];
      
      if(_onGridChange <> nil) then
        _onGridChange();
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
    
  procedure StateMachine.Act();
    begin
      //ACT STAFF  
    end;
end.
