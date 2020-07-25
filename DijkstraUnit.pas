Unit DijkstraUnit;

Interface 
  uses AlgorithmUnit;
  
  type 
    Dijkstra = class(Algorithm)
      private
       _dist : Grid;
       _prev : intArray;
       _point : Point;
       _length : integer;
       _timeMark : intArray;
       _constantMark : intArray;
      //Заполнить, если нужно будет
      
      function Weight(from, there: Point) : integer;
      
      public
        constructor Create(gridSize : integer; start, finish : Point);
        begin
          Inherited Create(gridSize, start, finish);
          _grid := new intArray[_gridSize];
          for var i := 0 to _gridSize - 1 do
            _grid[i] := new integer[_gridSize];
          _point := start;
          _length := MaxInt;
        end;
        procedure Step(); override;
        function GetGridLayout() : Grid; override;
        function GetPathLength() : integer; override;
    end;
    
Implementation
  function Dijkstra.Weight(from, there: Point) : Integer;
  begin
    if IsWalkable(from.x, from.y) and IsWalkable(there.x, there.y) 
    and (Distance(from.x, from.y, there.x, there.y) < 20)  then
      Weight := Distance(from.x, from.y, there.x, there.y)
    else 
      Weight := MaxInt;    
  end;               
  procedure Dijkstra.Step();
  var cell : Point;
      x, y : integer;
  begin
    if not _gridMark[_end.x][_end.y] then 
      begin
        {Обновление временных меток}
        for x := 0 to _gridSize - 1 do
          for y := 0 to _gridSize - 1 do
            cell.x := x;
            cell.y := y;
            if not _gridMark[x][y] and (_dist[x][y] > _dist[_point.x][_point.y]
            + (Weight(_point, cell))) then 
              begin
                _dist[x][y] := _dist[_point.x][_point.y] + Weight(_point, cell);
                _prev[x][y] := _point;
              end;
        {Поиск вершины с минимальной временной меткой}
        for x := 0 to _gridSize - 1 do
          for y := 0 to _gidSize - 1 do
            if not _gridMark[x][y] then
              if _weight > _dist[x][y] then
                begin
                  _weight := _dist[x][y];
                  _point := _dist[x][y];
                end;
        _gridMark[_point.x][_point.y] := TRUE;
        _constantMark[_point.x][_point.y] := _point;
      end
     else if _onFinish <> nil then _onFinish;
     if _onStep <> nil then _onStep;
  end; 
  
  function Dijkstra.GetGridLayout() : Grid;
    begin
      var temp := new intArray[_gridSize];
      for var i := 0 to _gridSize-1 do
        temp[i] := new integer[_gridSize];
      
      for var x := 0 to _gridSize - 1 do
        for y := 0 to _gridSize - 1 do
          begin  
            temp[_gridMark.x][_gridMark.y] := 3;
            temp[_constantMark.x][_constantMark.y] := 2; 
            temp[_prev.x][prev.y] := 4;
          end;
      
      GetGridLayout := temp
    end;
    
  function GetPathLength() : integer;
    begin
      GetPathLenght := 0;
    end;
end.      