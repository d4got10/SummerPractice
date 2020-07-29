unit ВFSUnit;

interface
  uses AlgorithmUnit;
  type
    BFSCell = class
      public
        coords : Point;
        distance : integer;
        from : Point;
    end;
    BFS = class(Algorithm)
      private
      _bfsGrid : Dictionary<(integer, integer), BFSCell>;
      _openSet : Queue<BFSCell>;
      _closedSet : List<BFSCell>;
      _path : List<BFSCell>;
      
      function GetNeighbours(cell : BFSCell) : List<BFSCell>; 
      public
      
      constructor Create(gridSize : integer; start, finish : Point);
      begin
        Inherited Create(gridSize, start, finish);
        _bfsGrid := new Dictionary<(integer, integer), BFSCell>;
        _openSet := new Queue<BFSCell>;
        _closedSet := new List<BFSCell>;
        _path := new List<BFSCell>;
        for var x := 0 to _gridSize - 1 do
          for var y := 0 to _gridSize - 1 do 
          begin
            var tempCell := new BFSCell;
            tempCell.coords.x := x;
            tempCell.coords.y := y;
            tempCell.distance := MaxInt;
            _bfsGrid.Add((x,y), tempCell);
          end;
        _bfsGrid[(start.x, start.y)].distance := 0;
        _openSet.Enqueue(_bfsGrid[(start.x, start.y)]);
      end;
      
      procedure Step(); override;
      function GetGridLayout() : Grid; override;
      function GetPathLength() : integer; override;
    end;
implementation
    procedure BFS.Step();
    var found : boolean;
    begin
      if(_openSet <> nil) and (_openSet.Count > 0) then
      begin
        var cell := _openSet.Dequeue();
        _closedSet.Add(cell);
        
        if(cell = _bfsGrid[(_end.x, _end.y)]) then
          found := true;
        
        var neighbours := GetNeighbours(cell);
        foreach var neighbour in neighbours do
          if not(_closedSet.Contains(neighbour)) then begin
             var newDist := cell.distance + Distance(cell.coords.x, cell.coords.y,
                                                                neighbour.coords.x, neighbour.coords.y);
             if (neighbour.distance > newDist) then
               begin
                 neighbour.distance := newDist;
                 neighbour.from := cell.coords;
                 _openSet.Enqueue(neighbour); //Добавка
               end;
          end;
      end else
      if(_onFinish <> nil) and not(found) then begin
          _onFinish();
          exit;
          end;
      
      if(found)then begin
        var tempCell := _bfsGrid[(_end.x, _end.y)];
        _path.Add(tempCell);
        while(tempCell <> _bfsGrid[(_start.x, _start.y)])do
        begin
          tempCell := _bfsGrid[(tempCell.from.x, tempCell.from.y)];
          _path.Add(tempCell);
        end;
      end;
      
      if(_onStep <> nil)then
        _onStep();
      if(found and (_onFinish <> nil))then
        _onFinish();
    end;
    
    function BFS.GetGridLayout() : Grid;
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
    
    function BFS.GetNeighbours(cell : BFSCell) : List<BFSCell>;
    var neighbours : List<BFSCell>;
        neighbour : BFSCell;
    begin
      neighbours := new List<BFSCell>;
      for var x := -1 to 1 do
      for var y := -1 to 1 do 
        if(x <> 0) or (y <> 0) then
          if(_bfsGrid.TryGetValue((cell.coords.x + x, cell.coords.y + y), neighbour)
            and IsWalkable(cell.coords.x + x, cell.coords.y + y)) then
            neighbours.Add(neighbour);
      GetNeighbours := neighbours;
    end;
    
    function BFS.GetPathLength() : integer;
    begin
      var length := 0;
      for var i := 0 to _path.Count-2 do
        length += Distance(_path[i].coords.x, _path[i].coords.y, 
                           _path[i+1].coords.x, _path[i+1].coords.y);
      GetPathLength := length;
    end;
end.