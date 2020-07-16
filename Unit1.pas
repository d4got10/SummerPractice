Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, GraphWPF;

type
  Form1 = class(Form)
    procedure button6_Click(sender: Object; e: EventArgs);
    procedure Form1_Load(sender: Object; e: EventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure button4_Click(sender: Object; e: EventArgs);
    procedure button3_Click(sender: Object; e: EventArgs);
    procedure radioButton6_CheckedChanged(sender: Object; e: EventArgs);
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

(* Обработчик события "нажатие кнопки мыши" *)
procedure ColorCell(x,y,bottom: integer);
begin
  if bottom=1 then FillRectangle(x,y,1,1,clRandom);
end;

procedure Form1.Form1_Load(sender: Object; e: EventArgs);
begin
  Window.Caption := 'Визуализация алгоритмов поиска кратчайшего пути';
  SetMathematicCoords(0, 20, 20, true);
  //OnMouseDown := ColorCell; (* нажатие кнопки мыши *)
  //OnMouseMove := ColorCell; (* перемещение мыши *)
end;

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
  SetMathematicCoords(0, 20, 20, true);
end;

procedure Form1.button3_Click(sender: Object; e: EventArgs);
begin
  
end;

procedure Form1.radioButton6_CheckedChanged(sender: Object; e: EventArgs);
begin
  //brush
end;

end.
