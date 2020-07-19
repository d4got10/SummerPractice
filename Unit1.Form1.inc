procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        self.radioButton1 := new System.Windows.Forms.RadioButton();
        self.radioButton2 := new System.Windows.Forms.RadioButton();
        self.radioButton3 := new System.Windows.Forms.RadioButton();
        self.radioButton4 := new System.Windows.Forms.RadioButton();
        self.radioButton5 := new System.Windows.Forms.RadioButton();
        self.radioButton6 := new System.Windows.Forms.RadioButton();
        self.radioButton7 := new System.Windows.Forms.RadioButton();
        self.radioButton8 := new System.Windows.Forms.RadioButton();
        self.groupBox1 := new System.Windows.Forms.GroupBox();
        self.groupBox2 := new System.Windows.Forms.GroupBox();
        self.button1 := new System.Windows.Forms.Button();
        self.button2 := new System.Windows.Forms.Button();
        self.button3 := new System.Windows.Forms.Button();
        self.button4 := new System.Windows.Forms.Button();
        self.button5 := new System.Windows.Forms.Button();
        self.button6 := new System.Windows.Forms.Button();
        self.radioButton9 := new System.Windows.Forms.RadioButton();
        self.radioButton10 := new System.Windows.Forms.RadioButton();
        self.radioButton11 := new System.Windows.Forms.RadioButton();
        self.groupBox3 := new System.Windows.Forms.GroupBox();
        self.label1 := new System.Windows.Forms.Label();
        self.label2 := new System.Windows.Forms.Label();
        self.label3 := new System.Windows.Forms.Label();
        self.label4 := new System.Windows.Forms.Label();
        self.timer1 := new System.Windows.Forms.Timer(self.components);
        self.radioButton12 := new System.Windows.Forms.RadioButton();
        self.groupBox1.SuspendLayout();
        self.groupBox2.SuspendLayout();
        self.groupBox3.SuspendLayout();
        self.SuspendLayout();
        // 
        // radioButton1
        // 
        self.radioButton1.Location := new System.Drawing.Point(21, 25);
        self.radioButton1.Name := 'radioButton1';
        self.radioButton1.Size := new System.Drawing.Size(182, 24);
        self.radioButton1.TabIndex := 0;
        self.radioButton1.Text := 'Дейкстра';
        self.radioButton1.UseVisualStyleBackColor := true;
        // 
        // radioButton2
        // 
        self.radioButton2.Location := new System.Drawing.Point(21, 55);
        self.radioButton2.Name := 'radioButton2';
        self.radioButton2.Size := new System.Drawing.Size(182, 24);
        self.radioButton2.TabIndex := 0;
        self.radioButton2.Text := 'radioButton1';
        self.radioButton2.UseVisualStyleBackColor := true;
        // 
        // radioButton3
        // 
        self.radioButton3.Location := new System.Drawing.Point(21, 85);
        self.radioButton3.Name := 'radioButton3';
        self.radioButton3.Size := new System.Drawing.Size(182, 24);
        self.radioButton3.TabIndex := 0;
        self.radioButton3.Text := 'radioButton1';
        self.radioButton3.UseVisualStyleBackColor := true;
        // 
        // radioButton4
        // 
        self.radioButton4.Location := new System.Drawing.Point(21, 115);
        self.radioButton4.Name := 'radioButton4';
        self.radioButton4.Size := new System.Drawing.Size(182, 24);
        self.radioButton4.TabIndex := 0;
        self.radioButton4.Text := 'radioButton1';
        self.radioButton4.UseVisualStyleBackColor := true;
        // 
        // radioButton5
        // 
        self.radioButton5.Location := new System.Drawing.Point(21, 145);
        self.radioButton5.Name := 'radioButton5';
        self.radioButton5.Size := new System.Drawing.Size(182, 24);
        self.radioButton5.TabIndex := 0;
        self.radioButton5.Text := 'radioButton1';
        self.radioButton5.UseVisualStyleBackColor := true;
        // 
        // radioButton6
        // 
        self.radioButton6.Checked := true;
        self.radioButton6.Location := new System.Drawing.Point(21, 28);
        self.radioButton6.Name := 'radioButton6';
        self.radioButton6.Size := new System.Drawing.Size(142, 24);
        self.radioButton6.TabIndex := 0;
        self.radioButton6.TabStop := true;
        self.radioButton6.Text := 'Точка начала';
        self.radioButton6.UseVisualStyleBackColor := true;
        self.radioButton6.MouseClick += radioButton6_MouseClick;
        // 
        // radioButton7
        // 
        self.radioButton7.Location := new System.Drawing.Point(21, 58);
        self.radioButton7.Name := 'radioButton7';
        self.radioButton7.Size := new System.Drawing.Size(142, 24);
        self.radioButton7.TabIndex := 0;
        self.radioButton7.Text := 'Точка конца';
        self.radioButton7.UseVisualStyleBackColor := true;
        self.radioButton7.MouseClick += radioButton7_MouseClick;
        // 
        // radioButton8
        // 
        self.radioButton8.Location := new System.Drawing.Point(21, 88);
        self.radioButton8.Name := 'radioButton8';
        self.radioButton8.Size := new System.Drawing.Size(142, 24);
        self.radioButton8.TabIndex := 0;
        self.radioButton8.Text := 'Преграда';
        self.radioButton8.UseVisualStyleBackColor := true;
        self.radioButton8.MouseClick += radioButton8_MouseClick;
        // 
        // groupBox1
        // 
        self.groupBox1.Controls.Add(self.radioButton2);
        self.groupBox1.Controls.Add(self.radioButton1);
        self.groupBox1.Controls.Add(self.radioButton5);
        self.groupBox1.Controls.Add(self.radioButton3);
        self.groupBox1.Controls.Add(self.radioButton4);
        self.groupBox1.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.groupBox1.Location := new System.Drawing.Point(37, 414);
        self.groupBox1.Name := 'groupBox1';
        self.groupBox1.Size := new System.Drawing.Size(209, 185);
        self.groupBox1.TabIndex := 2;
        self.groupBox1.TabStop := false;
        self.groupBox1.Text := 'Алгоритмы';
        // 
        // groupBox2
        // 
        self.groupBox2.Controls.Add(self.radioButton7);
        self.groupBox2.Controls.Add(self.radioButton6);
        self.groupBox2.Controls.Add(self.radioButton12);
        self.groupBox2.Controls.Add(self.radioButton8);
        self.groupBox2.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.groupBox2.Location := new System.Drawing.Point(37, 12);
        self.groupBox2.Name := 'groupBox2';
        self.groupBox2.Size := new System.Drawing.Size(209, 160);
        self.groupBox2.TabIndex := 1;
        self.groupBox2.TabStop := false;
        self.groupBox2.Text := 'Ячейки';
        // 
        // button1
        // 
        self.button1.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.button1.Location := new System.Drawing.Point(37, 284);
        self.button1.Name := 'button1';
        self.button1.Size := new System.Drawing.Size(209, 33);
        self.button1.TabIndex := 4;
        self.button1.Text := 'Выполнить';
        self.button1.UseVisualStyleBackColor := true;
        self.button1.Click += button1_Click;
        // 
        // button2
        // 
        self.button2.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.button2.Location := new System.Drawing.Point(37, 323);
        self.button2.Name := 'button2';
        self.button2.Size := new System.Drawing.Size(209, 33);
        self.button2.TabIndex := 4;
        self.button2.Text := 'Остановить';
        self.button2.UseVisualStyleBackColor := true;
        self.button2.Click += button2_Click;
        // 
        // button3
        // 
        self.button3.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.button3.Location := new System.Drawing.Point(37, 362);
        self.button3.Name := 'button3';
        self.button3.Size := new System.Drawing.Size(209, 37);
        self.button3.TabIndex := 4;
        self.button3.Text := 'Продвинуться на шаг';
        self.button3.UseVisualStyleBackColor := true;
        // 
        // button4
        // 
        self.button4.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.button4.Location := new System.Drawing.Point(37, 178);
        self.button4.Name := 'button4';
        self.button4.Size := new System.Drawing.Size(209, 37);
        self.button4.TabIndex := 4;
        self.button4.Text := 'Очистить поле';
        self.button4.UseVisualStyleBackColor := true;
        self.button4.Click += button4_Click;
        // 
        // button5
        // 
        self.button5.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.button5.Location := new System.Drawing.Point(37, 221);
        self.button5.Name := 'button5';
        self.button5.Size := new System.Drawing.Size(209, 37);
        self.button5.TabIndex := 4;
        self.button5.Text := 'Удалить преграды';
        self.button5.UseVisualStyleBackColor := true;
        // 
        // button6
        // 
        self.button6.Font := new System.Drawing.Font('Microsoft Sans Serif', 9, System.Drawing.FontStyle.Bold);
        self.button6.Location := new System.Drawing.Point(37, 756);
        self.button6.Name := 'button6';
        self.button6.Size := new System.Drawing.Size(209, 37);
        self.button6.TabIndex := 4;
        self.button6.Text := 'Выход';
        self.button6.UseVisualStyleBackColor := true;
        self.button6.Click += button6_Click;
        // 
        // radioButton9
        // 
        self.radioButton9.CheckAlign := System.Drawing.ContentAlignment.TopCenter;
        self.radioButton9.Location := new System.Drawing.Point(26, 21);
        self.radioButton9.Name := 'radioButton9';
        self.radioButton9.Size := new System.Drawing.Size(35, 46);
        self.radioButton9.TabIndex := 5;
        self.radioButton9.Text := '1';
        self.radioButton9.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.radioButton9.UseVisualStyleBackColor := true;
        self.radioButton9.MouseClick += radioButton9_MouseClick;
        // 
        // radioButton10
        // 
        self.radioButton10.CheckAlign := System.Drawing.ContentAlignment.TopCenter;
        self.radioButton10.Checked := true;
        self.radioButton10.Location := new System.Drawing.Point(88, 21);
        self.radioButton10.Name := 'radioButton10';
        self.radioButton10.Size := new System.Drawing.Size(35, 46);
        self.radioButton10.TabIndex := 5;
        self.radioButton10.TabStop := true;
        self.radioButton10.Text := '2';
        self.radioButton10.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.radioButton10.UseVisualStyleBackColor := true;
        self.radioButton10.MouseClick += radioButton10_MouseClick;
        // 
        // radioButton11
        // 
        self.radioButton11.CheckAlign := System.Drawing.ContentAlignment.TopCenter;
        self.radioButton11.Location := new System.Drawing.Point(147, 21);
        self.radioButton11.Name := 'radioButton11';
        self.radioButton11.Size := new System.Drawing.Size(35, 46);
        self.radioButton11.TabIndex := 5;
        self.radioButton11.Text := '3';
        self.radioButton11.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.radioButton11.UseVisualStyleBackColor := true;
        self.radioButton11.MouseClick += radioButton11_MouseClick;
        // 
        // groupBox3
        // 
        self.groupBox3.Controls.Add(self.radioButton9);
        self.groupBox3.Controls.Add(self.radioButton10);
        self.groupBox3.Controls.Add(self.radioButton11);
        self.groupBox3.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.groupBox3.Location := new System.Drawing.Point(37, 615);
        self.groupBox3.Name := 'groupBox3';
        self.groupBox3.Size := new System.Drawing.Size(209, 73);
        self.groupBox3.TabIndex := 6;
        self.groupBox3.TabStop := false;
        self.groupBox3.Text := 'Скорость анимации';
        // 
        // label1
        // 
        self.label1.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.label1.Location := new System.Drawing.Point(37, 698);
        self.label1.Name := 'label1';
        self.label1.Size := new System.Drawing.Size(163, 23);
        self.label1.TabIndex := 7;
        self.label1.Text := 'Длина пути:';
        self.label1.TextAlign := System.Drawing.ContentAlignment.TopRight;
        // 
        // label2
        // 
        self.label2.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.label2.Location := new System.Drawing.Point(37, 727);
        self.label2.Name := 'label2';
        self.label2.Size := new System.Drawing.Size(163, 23);
        self.label2.TabIndex := 7;
        self.label2.Text := 'Исследовано клеток:';
        self.label2.TextAlign := System.Drawing.ContentAlignment.TopRight;
        // 
        // label3
        // 
        self.label3.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.label3.Location := new System.Drawing.Point(197, 698);
        self.label3.Name := 'label3';
        self.label3.Size := new System.Drawing.Size(82, 23);
        self.label3.TabIndex := 7;
        // 
        // label4
        // 
        self.label4.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.label4.Location := new System.Drawing.Point(197, 727);
        self.label4.Name := 'label4';
        self.label4.Size := new System.Drawing.Size(82, 23);
        self.label4.TabIndex := 7;
        // 
        // timer1
        // 
        self.timer1.Enabled := true;
        self.timer1.Interval := 1;
        self.timer1.Tick += timer1_Tick;
        // 
        // radioButton12
        // 
        self.radioButton12.Location := new System.Drawing.Point(21, 118);
        self.radioButton12.Name := 'radioButton12';
        self.radioButton12.Size := new System.Drawing.Size(142, 24);
        self.radioButton12.TabIndex := 0;
        self.radioButton12.Text := 'Ластик';
        self.radioButton12.UseVisualStyleBackColor := true;
        self.radioButton12.MouseClick += radioButton12_MouseClick;
        // 
        // Form1
        // 
        self.ClientSize := new System.Drawing.Size(282, 813);
        self.Controls.Add(self.label2);
        self.Controls.Add(self.label4);
        self.Controls.Add(self.label3);
        self.Controls.Add(self.label1);
        self.Controls.Add(self.button5);
        self.Controls.Add(self.button4);
        self.Controls.Add(self.button6);
        self.Controls.Add(self.button3);
        self.Controls.Add(self.button2);
        self.Controls.Add(self.button1);
        self.Controls.Add(self.groupBox2);
        self.Controls.Add(self.groupBox1);
        self.Controls.Add(self.groupBox3);
        self.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.FormBorderStyle := System.Windows.Forms.FormBorderStyle.FixedToolWindow;
        self.Location := new System.Drawing.Point(150, 100);
        self.Name := 'Form1';
        self.StartPosition := System.Windows.Forms.FormStartPosition.Manual;
        self.Text := 'Параметры';
        self.groupBox1.ResumeLayout(false);
        self.groupBox2.ResumeLayout(false);
        self.groupBox3.ResumeLayout(false);
        self.ResumeLayout(false);
    end;
