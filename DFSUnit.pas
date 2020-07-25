unit DFSUnit;

  Interface
    uses AlgorithmUnit;
    type
      DFSCell = class
        public
          coords : Point;
          distance : integer;
          from : Point;
      end;
      DFS = class(Algorithm)
        private
          _dfsGrid : Dictionary<(integer, integer), DFSCell>;
          _openSet : Stack<DFSCell>;
          _closedSet : List<DFSCell>;
          _path : List<DFSCell>;
          
          function GetNeighbours (cell : DFSCell) : List<DFSCell>;
        public
        
          constructor Create(gridSize : integer; start, finish : Point);
            begin
              Inherited Create(gridSize, start, finish);
              _dfsGrid := new Dictionary<(integer, integer), DFSCell>;
              _openSet := new Stack<DFSCell>;
              _closedSet := new List<DFSCell>;
              _path := new List<DFSCell>;
              for var x := 0 to _gridSize - 1 do
                for var y := 0 to _gridSize - 1 do 
                  begin
                    var tempCell := new DFSCell;
                    tempCell.coords.x := x;
                    tempCell.coords.y := y;
                    tempCell.distance := MaxInt;
                    _dfsGrid.Add((x, y), tempCell);
                  end;
              _dfsGrid[(start.x, start.y)].distance := 0;
              _openSet.Push(_dfsGrid[(start.x, start.y)]);
            end;
            
          procedure Step(); override;
          function GetGridLayout() : Grid; override;
          function GetPathLength() : integer; override;
      end;
      
  Implementation
    Procedure DFS.Step();
      var found : boolean;
          cell : DFSCell;
      begin
        if (_openSet <> nil) and (_openSet.Count > 0) then
          begin
            if(cell = _dfsGrid[(_end.x, _end.y)]) then
              found := true;
            else 
              begin
                var neighbours := GetNeighbours(cell);
                foreach var neighbour in neighbours do
                  if not(_closedSet.Contains(neighbour))
                  and not(_openSet.Contains(neighbour)) then
                     begin
                       _openSet.Push(neighbour);
                       neighbour.distance := cell.distance + Distance(cell.coords.x, cell.coords.y,
                                                                      neighbour.coords.x, neighbour.coords.y);
                       neighbour.from := cell.coords;
                     end
                  else if _openSet <> nil then
                   begin
                     cell := _openSet.Pop();
                     _closedSet.Add(cell);
                   end;
              end;
           end;
      
      if(found)then begin
        var tempCell := _dfsGrid[(_end.x, _end.y)];
        _path.Add(tempCell);
        while(tempCell <> _dfsGrid[(_start.x, _start.y)])do
        begin
          tempCell := _dfsGrid[(tempCell.from.x, tempCell.from.y)];
          _path.Add(tempCell);
        end;
      end;
      
      if(_onStep <> nil)then
        _onStep();
      if(found and (_onFinish <> nil))then
        _onFinish();
      end;
      
      function dFS.GetGridLayout() : Grid;
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
    
    function DFS.GetPathLength() : integer;
    begin
      var length := 0;
      for var i := 0 to _path.Count-2 do
        length += Distance(_path[i].coords.x, _path[i].coords.y, 
                           _path[i+1].coords.x, _path[i+1].coords.y);
      GetPathLength := length;
    end;
    
    function DFS.GetNeighbours(cell : DFSCell) : List<DFSCell>;
    var neighbours : List<DFSCell>;
        neighbour : DFSCell;
    begin
      neighbours := new List<DFSCell>;
      for var x := -1 to 1 do
        for var y := -1 to 1 do 
          if(x <> 0) or (y <> 0) then
            if(_dfsGrid.TryGetValue((cell.coords.x + x, cell.coords.y + y), neighbour)
              and IsWalkable(cell.coords.x + x, cell.coords.y + y)) then
              neighbours.Add(neighbour);
      GetNeighbours := neighbours;
    end;
end.      