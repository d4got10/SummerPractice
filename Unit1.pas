Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms, GraphWPF;

type
  Form1 = class(Form)
    procedure button6_Click(sender: Object; e: EventArgs);
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
  end;

implementation

procedure Form1.button6_Click(sender: Object; e: EventArgs);
begin
  Window.Close;
end;

end.
