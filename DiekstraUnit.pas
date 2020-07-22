Unit DiekstraUnit;

Interface 
  uses AlgorithmUnit;
  
  type 
    Diekstra = class(Algorithm);
      private
       _dist : Grid;
       _prev : intArray;
       _point : Point;
       _length : integer
      //Заполнить, если нужно будет
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
    end;
    
Implementation
  function Diekstra.Weight(from, there: Point) : Integer;
  begin
    if IsWalkable(from.x, from.y) and IsWalkable(there.x, there.y) 
    and Distance(from.x, from.y, there.x, there.y) < 20  then
      Weight := Distance(from.x, from.y, there.x, there.y);
    else 
      Weight := MaxInt;    
  end;               
  procedure Diekstra.Step();
  begin
    if not _gridMark[finish.x][finish.y] then 
      begin
        for var x := 0 to _gridSize - 1 do
          for var y := 0 to _gridSize - 1 do
            if not _gridMark[x][y] and (_dist[x][y] > _dist[_point.x][_point.y] 
            + Weight[_point.x, point.y]) then 
              begin
                _dist[x][y] := _dist[_point.x][_point.y] + Weight[_point.x][point.y];
                _prev[x][y] := _point;
              end;
        for var x := 0 to _gridSize - 1 do
          for var y := 0 to _gidSize - 1 do
            if not _gridMark[x][y] then
              if _weight > _dist[x][y] then
                begin
                  _weight := _dist[x][y];
                  _point := _dist[x][y];
                end;
        _gridMark[_point.x][_point.y] := TRUE;
      end
     else if _onFinish <> nil then _onFinish;
     if _onStep <> nil then _onStep;
  end; 
  
  function Diekstra.GetGridLayout() : Grid;
    begin
      var temp := new intArray[_gridSize];
      for var i := 0 to _gridSize-1 do
        temp[i] := new integer[_gridSize];
      
      GetGridLayout := temp
    end;
end.      