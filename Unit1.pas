Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, Unit2, GraphWPF, StateMachineUnit;

type
  Form1 = class(Form)
    procedure button6_Click(sender: Object; e: EventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure button4_Click(sender: Object; e: EventArgs);
    procedure radioButton6_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton7_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton8_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton9_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton10_MouseClick(sender: Object; e: MouseEventArgs);
    procedure radioButton11_MouseClick(sender: Object; e: MouseEventArgs);
    procedure timer1_Tick(sender: Object; e: EventArgs);
    procedure radioButton12_MouseClick(sender: Object; e: MouseEventArgs);
  {$region FormDesigner}
  private
    {$resource Unit1.Form1.resources}
    radioButton2: RadioButton;
    radioButton3: RadioButton;
    radioButton4: RadioButton;
    radioButton5: RadioButton;
    radioButton6: RadioButton;
    radioButton7: RadioButton;
    radioButton8: RadioButton;
    groupBox1: GroupBox;
    groupBox2: GroupBox;
    button1: Button;
    button2: Button;
    button3: Button;
    button4: Button;
    button5: Button;
    button6: Button;
    radioButton9: RadioButton;
    radioButton10: RadioButton;
    radioButton11: RadioButton;
    groupBox3: GroupBox;
    label1: &Label;
    label2: &Label;
    label3: &Label;
    label4: &Label;
    timer1: Timer;
    components: System.ComponentModel.IContainer;
    radioButton12: RadioButton;
    radioButton1: RadioButton;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end; //Form1 class

implementation

procedure Form1.button6_Click(sender: Object; e: EventArgs);
begin
  Window.Close;
end;

procedure Form1.button1_Click(sender: Object; e: EventArgs);
begin
  if button1.Text = 'Пауза' 
    then 
      begin
        machine.IsPlaying := false;
        button1.Text := 'Продолжить';
      end
    else 
     begin
       machine.IsPlaying := true;
       button1.Text := 'Пауза';
     end;
end;

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  button1.Text := 'Выполнить';
end;

procedure Form1.button4_Click(sender: Object; e: EventArgs);
begin
  machine.ClearGrid();
  //CreateWindow;
end;

procedure Form1.radioButton6_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 5;
end;

procedure Form1.radioButton7_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 6;
end;

procedure Form1.radioButton8_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 1;
end;

procedure Form1.radioButton9_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(1);
end;

procedure Form1.radioButton10_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(2);
end;

procedure Form1.radioButton11_MouseClick(sender: Object; e: MouseEventArgs);
begin
  machine.SetSpeed(3);
end;

procedure Form1.timer1_Tick(sender: Object; e: EventArgs);
begin
  machine.MainLoop();
end;

procedure Form1.radioButton12_MouseClick(sender: Object; e: MouseEventArgs);
begin
  celltype := 0;
end;


end.
