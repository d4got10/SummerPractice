Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, Unit2, GraphWPF, StateMachineUnit;

type
  Form_Settings = class(Form)
    procedure button6_Click(sender: Object; e: EventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure b_ClearGrid_Click(sender: Object; e: EventArgs);
    procedure radioButton6_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton7_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton8_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton9_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton10_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton11_MouseClick(sender: Object; e: MouseEventArgs);
    procedure timer1_Tick(sender: Object; e: EventArgs);
    procedure radioButton12_MouseClick(sender: Object; e: MouseEventArgs);
    procedure Form1_Shown(sender: Object; e: EventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form_Settings.resources}
    rb_algAStar: RadioButton;
    rb_algWidthSearch: RadioButton;
    rb_algDeepSearch: RadioButton;
    rb_cell5: RadioButton;
    rb_cell6: RadioButton;
    rb_cell1: RadioButton;
    groupBox_Algorithms: GroupBox;
    groupBox_CellTypes: GroupBox;
    b_Act_Pause: Button;
    b_Stop: Button;
    b_DoStep: Button;
    b_ClearGrid: Button;
    b_DeleteObstacles: Button;
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
    rb_algDejkstra: RadioButton;
    {$include Unit1.Form_Settings.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end; //Form1 class

implementation

procedure Form_Settings.button6_Click(sender: Object; e: EventArgs);
begin
  Window.Close;
end;

procedure Form_Settings.button1_Click(sender: Object; e: EventArgs);
begin
  if b_Act_Pause.Text = 'Пауза' 
    then 
      begin
        machine.IsPlaying := false;
        b_Act_Pause.Text := 'Продолжить';
      end
    else 
     begin
       machine.IsPlaying := true;
       b_Act_Pause.Text := 'Пауза';
     end;
end;

procedure Form_Settings.button2_Click(sender: Object; e: EventArgs);
begin
  b_Act_Pause.Text := 'Выполнить';
end;

procedure Form_Settings.b_ClearGrid_Click(sender: Object; e: EventArgs);
begin
  machine.ClearGrid();
end;

procedure Form_Settings.radioButton6_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 5;
end;

procedure Form_Settings.radioButton7_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 6;
end;

procedure Form_Settings.radioButton8_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 1;
end;

procedure Form_Settings.radioButton9_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(1);
end;

procedure Form_Settings.radioButton10_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(2);
end;

procedure Form_Settings.radioButton11_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(3);
end;

procedure Form_Settings.timer1_Tick(sender: Object; e: EventArgs);
begin
  machine.MainLoop();
end;

procedure Form_Settings.radioButton12_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 0;
end;

procedure Form_Settings.Form1_Shown(sender: Object; e: EventArgs);
begin
  celltype := 5;
  machine.SetSpeed(2);
end;

end.
