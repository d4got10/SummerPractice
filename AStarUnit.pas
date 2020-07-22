unit AStarUnit;

interface
  uses AlgorithmUnit;
  
  type
    AStarCell = record
      coords : Point;
      fCost : integer;
      gCost : integer;
      hCost : integer;
      from : Point;
    end;
    AStar = class(Algorithm)
      private
        _aStarGrid : Dictionary<(integer, integer), AStarCell>;
        _openSet : List<AStarCell>;
        _closedSet : List<AStarCell>;
        _path : List<AStarCell>;
        
        function GetNeighbours(cell : AStarCell) : List<AStarCell>;
      public
        constructor Create(gridSize : integer; start, finish : Point);
        begin
          Inherited Create(gridSize, start, finish);
          _aStarGrid := new Dictionary<(integer, integer), AStarCell>;
          for var x := 0 to _gridSize - 1 do
            for var y := 0 to _gridSize - 1 do 
            begin
              var tempCell := new AStarCell;
              tempCell.coords.x := x;
              tempCell.coords.y := y;
              tempCell.fCost := MaxInt;
              _aStarGrid.Add((x,y), tempCell);
            end;
          
          var startCell := _aStarGrid[(_start.x, _start.y)];
          startCell.hCost := Distance(_start.x, _start.y, _end.x, _end.y);
          startCell.fCost := startCell.hCost;
          
          _openSet := new List<AStarCell>;
          _openSet.Add(startCell);
          _closedSet := new List<AStarCell>;
          _path := new List<AStarCell>;
        end;
        procedure Step(); override;
        function GetGridLayout() : Grid; override;
    end;
    
implementation
  procedure AStar.Step();
  var cell : AStarCell;
      found : boolean;
  begin
    if(_openSet <> nil) and (_openSet.Count > 0)then
    begin
      cell := _openSet[0];
      foreach var tempCell in _openSet do
        if(tempCell.fCost < cell.fCost) then
          cell := tempCell;
      _openSet.Remove(cell);
      
      if(cell.coords = _end) then
        found := true
      else 
      begin
        var neighbours := GetNeighbours(cell);
        foreach var neighbour in neighbours do
          if(IsWalkable(neighbour.coords.x, neighbour.coords.y) 
              and not(_closedSet.Contains(neighbour))
              and not(_openSet.Contains(neighbour)))then
            _openSet.Add(neighbour);
              
        _closedSet.Add(cell);
      end;
    end;
    
    if(found)then 
    begin 
      while(cell.coords <> _start) do
      begin
        _path.Add(cell);
        cell := _aStarGrid[(cell.from.x, cell.from.y)];
      end;     
    end;
    
    if(_onStep <> nil) then
      _onStep();
    
    if(found) then
      if(_onFinish <> nil) then 
        _onFinish();
  end;
  
  function AStar.GetNeighbours(cell : AStarCell) : List<AStarCell>;
  var neighbours : List<AStarCell>;
      neighbour : AStarCell;     
  begin
    neighbours := new List<AStarCell>;
    for var x := -1 to 1 do
      for var y := -1 to 1 do 
        if(x <> 0) or (y <> 0) then
          if _aStarGrid.TryGetValue((cell.coords.x + x, cell.coords.y + y), neighbour) 
              and IsWalkable(cell.coords.x + x, cell.coords.y + y) then begin
            var gCost := cell.gCost + Distance(cell.coords.x, cell.coords.y, neighbour.coords.x, neighbour.coords.y);
            var hCost := Distance(neighbour.coords.x, neighbour.coords.y, _end.x, _end.y);
            var fCost := gCost + hCost;
            if(neighbour.fCost > fCost) or (neighbour.fCost = fCost) and (neighbour.hCost > hCost) then 
              begin           
                neighbour.gCost := gCost;
                neighbour.hCost := hCost;
                neighbour.fCost := fCost;
                neighbour.from := cell.coords;
                _aStarGrid[(cell.coords.x + x, cell.coords.y + y)] := neighbour;
              end;
            neighbours.Add(neighbour);
          end;
    GetNeighbours := neighbours;
  end;
  
  function AStar.GetGridLayout() : Grid;
  begin
    var temp := new intArray[_gridSize];
    for var i := 0 to _gridSize-1 do
      temp[i] := new integer[_gridSize];

    
    foreach var cell in _openSet do
      temp[cell.coords.x][cell.coords.y] := 3;
    foreach var cell in _closedSet do
      temp[cell.coords.x][cell.coords.y] := 2;
    foreach var cell in _path do
      temp[cell.coords.x][cell.coords.y] := 4;
    
    GetGridLayout := temp;
  end;
  
end.