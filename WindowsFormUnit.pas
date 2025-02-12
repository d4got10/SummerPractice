﻿Unit WindowsFormUnit;

interface

uses System, System.Drawing, System.Windows.Forms, GraphWindowUnit, GraphWPF, StateMachineUnit;

type
  Form_Settings = class(Form)
  
    procedure Form_Settings_Shown(sender: Object; e: EventArgs);
    procedure timer_Tick(sender: Object; e: EventArgs);
    
    procedure b_ClearGrid_Click(sender: Object; e: EventArgs);
    procedure b_Play_Pause_Click(sender: Object; e: EventArgs);
    procedure b_Stop_Click(sender: Object; e: EventArgs);
    procedure b_Act_Click(sender: Object; e: EventArgs);
    procedure b_Exit_Click(sender: Object; e: EventArgs);
    
    procedure rb_cell0_MouseClick(sender: Object; e: MouseEventArgs);
    procedure rb_cell1_MouseClick(sender: Object; e: MouseEventArgs);
    procedure rb_cell5_MouseClick(sender: Object; e: MouseEventArgs);
    procedure rb_cell6_MouseClick(sender: Object; e: MouseEventArgs);
    
    procedure rb_speed1_MouseClick(sender: Object; e: MouseEventArgs);
    procedure rb_speed2_MouseClick(sender: Object; e: MouseEventArgs);
    procedure rb_speed3_MouseClick(sender: Object; e: MouseEventArgs);
    
    procedure rb_algDijkstra_MouseClick(sender: Object; e: MouseEventArgs);
    procedure rb_algAStar_MouseClick(sender: Object; e: MouseEventArgs);
    procedure rb_algWFS_MouseClick(sender: Object; e: MouseEventArgs);
    procedure rb_algJPS_MouseClick(sender: Object; e: MouseEventArgs);
  {$region FormDesigner}
  private
    {$resource WindowsFormUnit.Form_Settings.resources}
    rb_algAStar: RadioButton;
    rb_algWFS: RadioButton;
    rb_algJPS: RadioButton;
    rb_cell5: RadioButton;
    rb_cell6: RadioButton;
    rb_cell1: RadioButton;
    groupBox_Algorithms: GroupBox;
    groupBox_CellTypes: GroupBox;
    b_Play_Pause: Button;
    b_Stop: Button;
    b_Act: Button;
    b_ClearGrid: Button;
    b_Exit: Button;
    rb_speed1: RadioButton;
    rb_speed2: RadioButton;
    rb_speed3: RadioButton;
    groupBox_animSpeed: GroupBox;
    label_Path: &Label;
    label_CellsResearched: &Label;
    label_PathInfo: &Label;
    label_CellsResearchedInfo: &Label;
    timer: Timer;
    components: System.ComponentModel.IContainer;
    rb_cell0: RadioButton;
    groupBox_Result: GroupBox;
    label_Info: &Label;
    rb_algDijkstra: RadioButton;
    {$include WindowsFormUnit.Form_Settings.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
    
    procedure Activation(switched: boolean);
    begin
      if switched = true then b_Play_Pause.Text := 'Запустить';
      groupBox_CellTypes.Enabled := switched;
      groupBox_Algorithms.Enabled := switched;
      b_ClearGrid.Enabled := switched;
      b_Stop.Enabled := not(switched);
      b_Act.Enabled := switched;
      canEdit := switched;
    end;
    
    procedure Finish;
    begin
      Activation(true);
      if machine.HasPath = true then
        label_info.Text := 'Длина шага напрямую 10, по диагонали 14'
      else
        label_info.Text := 'Проложить путь невозможно';
      label_PathInfo.Text := IntToStr(machine.PathLength);
      label_CellsResearchedInfo.Text := IntToStr(machine.ClosedCells);
      groupBox_Result.Visible := true;
    end;
    
  end; //Form1 class

implementation

{=====СОБЫТИЯ ФОРМЫ И НЕМНОГОЧИСЛЕННЫХ ЭЛЕМЕНТОВ=====}

procedure Form_Settings.Form_Settings_Shown(sender: Object; e: EventArgs);
begin
  celltype := 5;
  machine.ChangeAlgorithm(0);
  machine.SetSpeed(2);
  machine.OnComplete := Finish;
end;

procedure Form_Settings.timer_Tick(sender: Object; e: EventArgs);
begin
  machine.MainLoop();
end;

{=====СОБЫТИЯ КНОПОК=====}

procedure Form_Settings.b_ClearGrid_Click(sender: Object; e: EventArgs);
begin
  machine.ClearGrid();
  Activation(true);
end;

procedure Form_Settings.b_Play_Pause_Click(sender: Object; e: EventArgs);
begin
  if machine.IsPlaying = false 
    then begin
        machine.IsPlaying := true;
        b_Play_Pause.Text := 'Приостановить';
        Activation(false);
        groupBox_Result.Visible := false;
        label_PathInfo.Text := '';
        label_CellsResearchedInfo.Text := '';
    end
    else begin
       machine.IsPlaying := false;
       b_Play_Pause.Text := 'Продолжить';
       b_ClearGrid.Enabled := true;
       b_Act.Enabled := true;
    end;
end;

procedure Form_Settings.b_Stop_Click(sender: Object; e: EventArgs);
begin
  machine.IsPlaying := false;
  machine.ClearAlgorithmLayout();
  Activation(true);
end;

procedure Form_Settings.b_Act_Click(sender: Object; e: EventArgs);
begin
  Activation(false);
  b_Play_Pause.Text := 'Продолжить';
  b_ClearGrid.Enabled := true;
  b_Act.Enabled := true;
  machine.Act();
end;

procedure Form_Settings.b_Exit_Click(sender: Object; e: EventArgs);
begin
  Window.Close;
end;

{=====СОБЫТИЯ ПЕРЕКЛЮЧАТЕЛЕЙ=====}

procedure Form_Settings.rb_cell0_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 0;
end;

procedure Form_Settings.rb_cell1_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 1;
end;

procedure Form_Settings.rb_cell5_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 5;
end;

procedure Form_Settings.rb_cell6_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 6;
end;

procedure Form_Settings.rb_speed1_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(1);
end;

procedure Form_Settings.rb_speed2_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(2);
end;

procedure Form_Settings.rb_speed3_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(3);
end;

procedure Form_Settings.rb_algDijkstra_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.ChangeAlgorithm(0);
end;

procedure Form_Settings.rb_algAStar_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.ChangeAlgorithm(1);
end;

procedure Form_Settings.rb_algWFS_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.ChangeAlgorithm(2);
end;

procedure Form_Settings.rb_algJPS_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.ChangeAlgorithm(3);
end;


end.