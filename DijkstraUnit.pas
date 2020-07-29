unit DijkstraUnit;

  Interface
    uses AlgorithmUnit;
    
    Type
      DijkstraCell = class
        public
          coords : Point;
          distance : integer;
          from : Point;
      end;
      Dijkstra = class(Algorithm)
        private
          _dijkstraGrid : Dictionary<(integer, integer), DijkstraCell>;
          _openSet : List<DijkstraCell>;
          _closedSet : List<DijkstraCell>;
          _path : List<DijkstraCell>;
          function GetWeight(from, there: Point) : Integer;
          function GetNeighbours(cell : DijkstraCell) : List<DijkstraCell>;
        public
          constructor Create(gridSize : integer; start, finish : Point);
          begin
            Inherited Create(gridSize, start, finish);
            _dijkstraGrid := new Dictionary<(integer, integer), DijkstraCell>;
            for var x := 0 to _gridSize - 1 do
              for var y := 0 to _gridSize - 1 do
                begin
                  var tempCell := new DijkstraCell;
                  tempCell.coords.x := x;
                  tempCell.coords.y := y;
                  tempCell.distance := MaxInt;
                  _dijkstraGrid.Add((x, y), tempCell);
                end;
            
            var startCell := _dijkstraGrid [(_start.x, _start.y)];
            startCell.distance := 0;
            _openSet := new List<DijkstraCell>;
            _openSet.Add(startCell);
            _closedSet := new List<DijkstraCell>;
            _path := new List<DijkstraCell>;
          end;
          procedure Step(); override;
          function GetGridLayout() : Grid; override;
          function GetPathLength() : integer; override;
      end;
  Implementation
    function Dijkstra.GetWeight(from, there: Point) : Integer;
    begin
      if IsWalkable(from.x, from.y) and IsWalkable(there.x, there.y) 
      and (Distance(from.x, from.y, there.x, there.y) < 20)  then
        GetWeight := Distance(from.x, from.y, there.x, there.y)
      else 
        GetWeight := MaxInt;    
    end;    
    
    procedure Dijkstra.Step();
    var cell : DijkstraCell;
        found : boolean;
    begin
      found := false;
      if(_openSet <> nil) and (_openSet.Count > 0) then begin
          //Находим минимальную временную метку
          cell := _openSet[0];
          for var i := 1 to _openSet.Count-1 do
            if(_openSet[i].distance < cell.distance) then
              cell := _openSet[i];
         
          _openSet.Remove(cell);
          _closedSet.Add(cell);
          
          if(cell.coords = _end) then
            found := true
          else begin
            var neighbours := GetNeighbours(cell);
            foreach var neighbour in neighbours do begin
              var newDistance := cell.distance + Distance(cell.coords.x, cell.coords.y,
                                                          neighbour.coords.x, neighbour.coords.y);
              if(newDistance < neighbour.distance)then begin
                neighbour.distance := newDistance;
                neighbour.from := cell.coords;
              end;
              if not(_closedSet.Contains(neighbour)) and not(_openSet.Contains(neighbour)) then
                _openSet.Add(neighbour);
            end;      
          end;
      end else
        if(_onFinish <> nil) and not(found) then begin
          _onFinish();
          exit;
          end;
      
      if(found)then
      begin
        var tempCell := _dijkstraGrid[(_end.x, _end.y)];
        while(tempCell.coords <> _start) do begin
          _path.Add(tempCell);
          tempCell := _dijkstraGrid[(tempCell.from.x, tempCell.from.y)];
        end;
        _path.Add(tempCell);
      end;
      
      if(_onStep <> nil) then
        _onStep();
      
      if(found) then
        if(_onFinish <> nil) then
          _onFinish();
    end;
    
    function Dijkstra.GetNeighbours(cell : DijkstraCell) : List<DijkstraCell>;
    var neighbours : List<DijkstraCell>;
        neighbour : DijkstraCell;
    begin
      neighbours := new List<DijkstraCell>;
      for var x := -1 to 1 do
      for var y := -1 to 1 do 
        if(x <> 0) or (y <> 0) then
          if(_dijkstraGrid.TryGetValue((cell.coords.x + x, cell.coords.y + y), neighbour)
            and IsWalkable(cell.coords.x + x, cell.coords.y + y)) then
            neighbours.Add(neighbour);
      GetNeighbours := neighbours;
    end;
    
    {procedure Dijkstra.Step();
    var from, there: DijkstraCell;
        found : boolean;
        weight : integer;
    begin
      if (_openSet <> nil) and (_openSet.Count > 0) then
        begin
         from := _openSet[0];
         if (from.coords = _end) then
            found := true
          else
            begin
              for var x := 0 to _gridSize - 1 do
                for var y := 0 to _gridSize - 1 do
                  if not (_openSet.Contains(there)) 
                  and (there.distance > from.distance + GetWeight(from.coords, there.coords)) then
                    begin
                      there.distance := from.distance + GetWeight(from.coords, there.coords);
                      _closedSet.Add(there);
                    end;
              weight := MaxInt;
              for var x := 0 to _gridSize - 1 do
                for var y := 0 to _gridSize - 1 do
                  if not (_openSet.Contains(there)) then
                    if weight > there.distance then
                      begin
                        weight := there.distance;
                        there.from := there.coords;
                        from := there
                      end;
              _openSet.Add(from);
            end;
        end;
        
        if(found)then
          begin 
            while(there.coords <> _start) do
            begin
              _path.Add(there);
              there := _dijkstraGrid[(there.from.x, there.from.y)];
            end;     
          end;
          
        if(_onStep <> nil) then
          _onStep();
    
        if(found) then
          if(_onFinish <> nil) then 
            _onFinish();
        
    end;}
    
    function Dijkstra.GetGridLayout() : Grid;
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
  
  function Dijkstra.GetPathLength() : integer;
  begin
    var length := 0;
    for var i := 0 to _path.Count-2 do
      length += Distance(_path[i].coords.x, _path[i].coords.y, 
                         _path[i+1].coords.x, _path[i+1].coords.y);
    GetPathLength := length;
  end;
end.