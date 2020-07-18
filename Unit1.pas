Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, Unit2, GraphWPF;

type
  Form1 = class(Form)
    procedure button6_Click(sender: Object; e: EventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure button4_Click(sender: Object; e: EventArgs);
    procedure Form1_Deactivate(sender: Object; e: EventArgs);
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
    then button1.Text := 'Продолжить'
    else button1.Text := 'Пауза';
end;

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  button1.Text := 'Выполнить';
end;

procedure Form1.button4_Click(sender: Object; e: EventArgs);
begin
  Window.Clear;
  SetMathematicCoords(0, 20, 0, true);
end;

procedure Form1.Form1_Deactivate(sender: Object; e: EventArgs);
begin
  if radiobutton6.Checked = true then c := RGB(0,255,0);
  if radiobutton7.Checked = true then c := RGB(255,0,0);
  if radiobutton8.Checked = true then c := RGB(0,0,0);
end;

end.
