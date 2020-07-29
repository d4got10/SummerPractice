unit JPSUnit;

interface
  uses AlgorithmUnit, AStarUnit;
  
  type
    JPS = class(AStar)
      private
        _current : AStarCell;
        _temporary : AStarCell;
        _viewed : List<AStarCell>;
        procedure Jump(cell : AStarCell; direction : Point);
        procedure UpdateCell(cell : AStarCell; from : Point);
        function GetCell(parent : AStarCell; pos, dir : Point; var cell : AStarCell) : boolean;
        procedure AddCell(cell : AStarCell; from : Point);
      public
        constructor Create(gridSize : integer; start, finish : Point);
        begin
          Inherited Create(gridSize, start, finish);
          _viewed := new List<AStarCell>;
        end;
        procedure Step(); override;
        function GetGridLayout() : Grid; override;
        //function GetPathLength() : integer; override;
    end;
    
implementation
  procedure JPS.Step();
  var cell : AStarCell;
      found : boolean;
      direction : Point;
  begin
    if(_openSet <> nil) and (_openSet.Count > 0)then
    begin
      cell := _openSet[0];
      foreach var tempCell in _openSet do
        if(tempCell.fCost < cell.fCost) or (tempCell.fCost < cell.fCost) and (tempCell.hCost < cell.hCost) then
          cell := tempCell;
      _openSet.Remove(cell);
      _closedSet.Add(cell);
      _current := cell;
      
      if(cell.coords = _end) then
        found := true
      else 
      begin
        if(_end.x - _current.coords.x < 0) then
          direction.x := -1
        else
          direction.x := 1;
        
        if(_end.y - _current.coords.y < 0) then
          direction.y := -1
        else 
          direction.y := 1;
          
        Jump(_current, new Point(direction.x, direction.y));
        Jump(_current, new Point(-direction.x, -direction.y));
        Jump(_current, new Point(-direction.x, direction.y));
        Jump(_current, new Point(direction.x, -direction.y));
        
      end;
    end else
      if(_onFinish <> nil) and not(found) then begin
          _onFinish();
          exit;
          end;
    
    if(found)then 
    begin 
      var tempDir := cell.from;
      tempDir.x -=  cell.coords.x;
      tempDir.y -= cell.coords.y;
      var count := max(abs(tempDir.x), abs(tempDir.y));
      if(tempDir.x <> 0) then
        tempDir.x := tempDir.x div (abs(tempDir.x));
      if(tempDir.y <> 0) then
        tempDir.y := tempDir.y div (abs(tempDir.y));
      
      while(cell.coords <> _start) do
      begin
        if(count < 1) then begin
          tempDir := cell.from;
          tempDir.x -= cell.coords.x;
          tempDir.y -= cell.coords.y;
          count := max(abs(tempDir.x), abs(tempDir.y));
          if(tempDir.x <> 0) then
            tempDir.x := tempDir.x div (abs(tempDir.x));
          if(tempDir.y <> 0) then
            tempDir.y := tempDir.y div (abs(tempDir.y));
        end;
        _path.Add(cell);
        //write(cell.coords);
        //writeln(' from (',cell.coords.x + tempDir.x * count, ',',cell.coords.y + tempDir.y * count,') count=', count);
        
        if(_aStarGrid.ContainsKey((cell.coords.x + tempDir.x, cell.coords.y + tempDir.y)))then
          cell := _aStarGrid[(cell.coords.x + tempDir.x, cell.coords.y + tempDir.y)];
        count -= 1;
      end;
      _path.Add(_aStarGrid[(_start.x, _start.y)]);
    end;
    
    if(_onStep <> nil) then
      _onStep();
    
    if(found) then
      if(_onFinish <> nil) then 
        _onFinish();
  end;
  
  
  procedure JPS.AddCell(cell : AStarCell; from : Point);
  begin
    if not(_closedSet.Contains(cell)) and not(_openSet.Contains(cell)) then
    begin
      UpdateCell(cell, from);
      _openSet.Add(cell);
    end;
    
  end;
  
  
  procedure JPS.Jump(cell : AStarCell; direction : Point);
  var tempCell, neighbour, useless : AStarCell;
      found : boolean;
  begin
    //if(cell.coords = new Point(16, 13)) then
      //writeln(123);
    //if GetCell(cell, new Point(0, -1), direction, neighbour) then _viewed.Add(neighbour);
    //writeln(cell.coords, ' dir', direction, ' from(', cell.coords.x - direction.x, ',', cell.coords.y - direction.y, ')');
    if abs(direction.x + direction.y) mod 2 = 1 then begin //Прямое движение  
    
      //if GetCell(cell, new Point(-1, -1), direction, neighbour) then _viewed.Add(neighbour);
      //if GetCell(cell, new Point(1, -1), direction, neighbour) then _viewed.Add(neighbour);
      
      if(cell.coords = _end) then 
      begin 
        AddCell(_temporary, _current.coords);
        AddCell(_aStarGrid[(_end.x, _end.y)], _temporary.coords);
        exit;
      end;
      
      if GetCell(cell, new Point(-1, 0), direction, neighbour) then begin //Проверка стены слева
        if(IsWalkable(neighbour.coords.x, neighbour.coords.y)) then //Если нет, то откидываем. Если да, то...
          //_viewed.Add(neighbour)
        else begin
          if GetCell(cell, new Point(-1, 1), direction, tempCell) and IsWalkable(tempCell.coords.x, tempCell.coords.y) then begin // ...добавляем точку и вынужденного соседа 
            AddCell(_temporary, _current.coords);
            AddCell(cell, _temporary.coords);
            //AddCell(tempCell, cell.coords);
            found := true;
          end;
        end;
      end;
      
      if GetCell(cell, new Point(1, 0), direction, neighbour) then begin //Проверка стены справа
        if(IsWalkable(neighbour.coords.x, neighbour.coords.y)) then //Если нет, то откидываем. Если да, то...
          //_viewed.Add(neighbour)
        else begin
          if GetCell(cell, new Point(1, 1), direction, tempCell) and IsWalkable(tempCell.coords.x, tempCell.coords.y) then begin // ...добавляем точку и вынужденного соседа
            AddCell(_temporary, _current.coords);
            AddCell(cell, _temporary.coords);
            //AddCell(tempCell, cell.coords);
            found := true;
          end;
        end;
      end;
      
      if GetCell(cell, new Point(0, 1), direction, neighbour) then  //Движение вперед
        if(IsWalkable(neighbour.coords.x, neighbour.coords.y)) then
          Jump(neighbour, new Point(neighbour.coords.x - cell.coords.x, neighbour.coords.y - cell.coords.y));
      
    end
    else begin //Диагональное движение
      _temporary := cell;
      
      if(cell.coords = _end) then 
      begin 
        _viewed.Add(cell);
        AddCell(cell, _current.coords);
        exit;
      end;
      
      if GetCell(cell, new Point(-1, -1), direction, neighbour) then begin //Проверка стены справы
        if(IsWalkable(neighbour.coords.x, neighbour.coords.y)) then
          //_viewed.Add(neighbour)
        else begin
          if GetCell(cell, new Point(-1, 0), direction, tempCell) and IsWalkable(tempCell.coords.x, tempCell.coords.y) then begin
            AddCell(cell, _current.coords);
            AddCell(tempCell, cell.coords);
            found := true;
          end;
        end;
      end;
      
      if GetCell(cell, new Point(1, -1), direction, neighbour) then begin
        if(IsWalkable(neighbour.coords.x, neighbour.coords.y)) then
          //_viewed.Add(neighbour)
        else begin
          if GetCell(cell, new Point(1, 0), direction, tempCell) and IsWalkable(tempCell.coords.x, tempCell.coords.y) then begin
            AddCell(cell, _current.coords);
            AddCell(tempCell, cell.coords);
            found := true;
          end;
        end;
      end;
      
      if GetCell(cell, new Point(-1, 1), direction, neighbour) then 
        if(IsWalkable(neighbour.coords.x, neighbour.coords.y)) then
          Jump(neighbour, new Point(neighbour.coords.x - cell.coords.x, neighbour.coords.y - cell.coords.y));
        
      if GetCell(cell, new Point(1, 1), direction, neighbour) then 
        if(IsWalkable(neighbour.coords.x, neighbour.coords.y)) then
          Jump(neighbour, new Point(neighbour.coords.x - cell.coords.x, neighbour.coords.y - cell.coords.y));
        
      //if GetCell(cell, new Point(0, 1), direction, neighbour) then 
      //  if(IsWalkable(neighbour.coords.x, neighbour.coords.y)) then
      //    Jump(neighbour, new Point(neighbour.coords.x - cell.coords.x, neighbour.coords.y - cell.coords.y));
    end;
    
    if IsWalkable(cell.coords.x + direction.x, cell.coords.y + direction.y) and not(found) then begin
      if GetCell(cell, new Point(0, 1), direction, neighbour) then
        Jump(neighbour, direction);   
    end;
    {else begin     
      if(GetCell(cell, new Point(-1, 1), direction, tempCell)) then 
        if not(IsWalkable(tempCell.coords.x, tempCell.coords.y)) then _viewed.Add(tempCell)
        else begin
          AddCell(cell, _current.coords);
          AddCell(tempCell, cell.coords);
        end;
      if(GetCell(cell, new Point(1, 1), direction, tempCell)) then
        if not(IsWalkable(tempCell.coords.x, tempCell.coords.y)) then _viewed.Add(tempCell)
        else begin
          AddCell(cell, _current.coords);
          AddCell(tempCell, cell.coords);
        end;
    end;}
    _viewed.Add(cell);
  end;
  
  procedure JPS.UpdateCell(cell : AStarCell; from : Point);
  begin
    cell.gCost := _aStarGrid[(from.x, from.y)].gCost + Distance(cell.coords.x, cell.coords.y, from.x, from.y);
    cell.hCost := Distance(cell.coords.x, cell.coords.y, _end.x, _end.y);
    cell.fCost := cell.gCost + cell.hCost;
    cell.from := from;
  end;
  
  function JPS.GetGridLayout() : Grid;
  begin
    var temp := new intArray[_gridSize];
    for var i := 0 to _gridSize-1 do
      temp[i] := new integer[_gridSize];

    foreach var cell in _closedSet do
      temp[cell.coords.x][cell.coords.y] := 2;
    foreach var cell in _openSet do
      temp[cell.coords.x][cell.coords.y] := 3;
    foreach var cell in _path do
      temp[cell.coords.x][cell.coords.y] := 4;
    
    GetGridLayout := temp;
  end;
  
  function JPS.GetCell(parent : AStarCell; pos, dir : Point; var cell : AStarCell) : boolean;
  var cellPosition : Point;
  begin
      if(pos.x > 0) then begin
        cellPosition.x += dir.y;  
        cellPosition.y -= dir.x;
      end
      else if (pos.x < 0) then begin
        cellPosition.x -= dir.y;  
        cellPosition.y += dir.x;
      end;
      if(pos.y > 0) then begin
        cellPosition.x += dir.x;  
        cellPosition.y += dir.y;
      end
      else if(pos.y < 0) then begin
        cellPosition.x -= dir.x;  
        cellPosition.y -= dir.y;
      end;
    if (abs(cellPosition.x) > 1) or (abs(cellPosition.y) > 1) then begin
      cellPosition.x := cellPosition.x div 2;
      cellPosition.y := cellPosition.y div 2;
    end;  
    
    cellPosition.x += parent.coords.x;
    cellPosition.y += parent.coords.y;
    
    if _aStarGrid.TryGetValue((cellPosition.x, cellPosition.y), cell) then
      if _viewed.Contains(cell) or _openSet.Contains(cell) or _closedSet.Contains(cell) then
        GetCell := false
      else
        GetCell := true
    else 
      GetCell := false;
  end;
  
  {function AStar.GetPathLength() : integer;
  begin
    var length := 0;
    for var i := _path.Count-2 downto 0 do
      length += Distance(_path[i].coords.x, _path[i].coords.y, 
                         _path[i+1].coords.x, _path[i+1].coords.y);
    GetPathLength := length;
  end;}
  
end.