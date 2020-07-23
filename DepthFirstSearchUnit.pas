Unit DepthFirstSearchUnit;

  Interface
    uses AlgorithmUnit;
    
    type
      Stack = ^Element;
      Element = record 
        data : Point;
        next : Stack;
      end; 
      DepthFirstSearch = class(Algorithm)
        private
          _point, _section : Point;
          _dist : Grid;
          _prev : intArray;
          _head, _node : Stack;
          _timeMark : intArray;
          _constantMark : intArray;
          //Добавить, если нужно 
        public
          constructor Create(gridSize : integer; start, finish : Point);
          begin
            Inherited Create(gridSize, start, finish);
            _grid := new intArray[_gridSize];
            for var i := 0 to _gridSize - 1 do
              _grid[i] := new integer[_gridSize];
            _point := start;
            _section := start;
            _gridMark[_point.x][_point.y] := TRUE;
            _head := nil;
          end;
          procedure Step(); override;
          function GetGridLayout() : Grid; override;
       end;
       
Implementation
  function DepthFirstSearch.Neighbour(var section : Point; cell : Point) : boolean;
    begin
      for var x := -1 to 1 do
        for var y := -1 to 1 do
          if not _gridMark[cell.x + x][cell.y + y] and IsWalkable(cell.x + x, cell.y + y)
            then begin
              Neighbour := true;
              section.x := cell.x + x;
              section.y := cell.y + y;
              break;
            end
          else Neighbour := false;       
    end;
  procedure DepthFirstSearch.Step();
    begin
      if not _gridMark[finish.x][finish.y] then
        begin
          if Neighbour(_section, _point) then
            begin
              _node := _head;
              new(_head);
              _head^.data := _point;
              _head^.next := _node;
              _point := _section;
              _gridMark [_point.x][_point.y] := true;
            end;
          else if _head <> nil then
            begin
              _node := _head^.next;
              _point := _head^.data;
              dispose(_head);
              _head^.next := _node;
              _prev[_point.x][_point.y] := _point;
            end;
        end;
      else if _onFinish <> nil then _onFinish;
        if _onStep <> nil then _onStep;  
     end;
  
  function DepthFirstSearch.GetGridLayout() : Grid;
    begin
      var temp := new intArray[_gridSize];
      for var i := 0 to _gridSize-1 do
        temp[i] := new integer[_gridSize];
      
      for var x := 0 to _gridSize - 1 do
        for var y := 0 to _gridSize - 1 do
          begin
            temp[_gridMark.x][_gridMark.y] := 3;
            temp[_prev.x][_prev.y] := 2; 
            temp[_prev.x][_prev.y] := 4;
          end;
      
      GetGridLayout := temp
    end;
end.      