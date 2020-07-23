procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        self.rb_algDejkstra := new System.Windows.Forms.RadioButton();
        self.rb_algAStar := new System.Windows.Forms.RadioButton();
        self.rb_algWidthSearch := new System.Windows.Forms.RadioButton();
        self.rb_algDeepSearch := new System.Windows.Forms.RadioButton();
        self.rb_cell5 := new System.Windows.Forms.RadioButton();
        self.rb_cell6 := new System.Windows.Forms.RadioButton();
        self.rb_cell1 := new System.Windows.Forms.RadioButton();
        self.groupBox_Algorithms := new System.Windows.Forms.GroupBox();
        self.groupBox_CellTypes := new System.Windows.Forms.GroupBox();
        self.rb_cell0 := new System.Windows.Forms.RadioButton();
        self.b_Act_Pause := new System.Windows.Forms.Button();
        self.b_Stop := new System.Windows.Forms.Button();
        self.b_DoStep := new System.Windows.Forms.Button();
        self.b_ClearGrid := new System.Windows.Forms.Button();
        self.b_Exit := new System.Windows.Forms.Button();
        self.rb_speed1 := new System.Windows.Forms.RadioButton();
        self.rb_speed2 := new System.Windows.Forms.RadioButton();
        self.rb_speed3 := new System.Windows.Forms.RadioButton();
        self.groupBox_animSpeed := new System.Windows.Forms.GroupBox();
        self.label_Path := new System.Windows.Forms.Label();
        self.label_CellsResearched := new System.Windows.Forms.Label();
        self.label_PathInfo := new System.Windows.Forms.Label();
        self.label_CellsResearchedInfo := new System.Windows.Forms.Label();
        self.timer := new System.Windows.Forms.Timer(self.components);
        self.groupBox_Result := new System.Windows.Forms.GroupBox();
        self.label_Info := new System.Windows.Forms.Label();
        self.groupBox_Algorithms.SuspendLayout();
        self.groupBox_CellTypes.SuspendLayout();
        self.groupBox_animSpeed.SuspendLayout();
        self.groupBox_Result.SuspendLayout();
        self.SuspendLayout();
        // 
        // rb_algDejkstra
        // 
        self.rb_algDejkstra.Checked := true;
        self.rb_algDejkstra.Location := new System.Drawing.Point(21, 25);
        self.rb_algDejkstra.Name := 'rb_algDejkstra';
        self.rb_algDejkstra.Size := new System.Drawing.Size(182, 24);
        self.rb_algDejkstra.TabIndex := 0;
        self.rb_algDejkstra.TabStop := true;
        self.rb_algDejkstra.Text := 'Дейкстры';
        self.rb_algDejkstra.UseVisualStyleBackColor := true;
        self.rb_algDejkstra.MouseClick += rb_algDejkstra_MouseClick;
        // 
        // rb_algAStar
        // 
        self.rb_algAStar.Location := new System.Drawing.Point(21, 55);
        self.rb_algAStar.Name := 'rb_algAStar';
        self.rb_algAStar.Size := new System.Drawing.Size(182, 24);
        self.rb_algAStar.TabIndex := 0;
        self.rb_algAStar.Text := 'А-звезда';
        self.rb_algAStar.UseVisualStyleBackColor := true;
        self.rb_algAStar.MouseClick += rb_algAStar_MouseClick;
        // 
        // rb_algWidthSearch
        // 
        self.rb_algWidthSearch.Location := new System.Drawing.Point(21, 85);
        self.rb_algWidthSearch.Name := 'rb_algWidthSearch';
        self.rb_algWidthSearch.Size := new System.Drawing.Size(182, 24);
        self.rb_algWidthSearch.TabIndex := 0;
        self.rb_algWidthSearch.Text := 'Поиск в ширину';
        self.rb_algWidthSearch.UseVisualStyleBackColor := true;
        self.rb_algWidthSearch.MouseClick += rb_algWidthSearch_MouseClick;
        // 
        // rb_algDeepSearch
        // 
        self.rb_algDeepSearch.Location := new System.Drawing.Point(21, 115);
        self.rb_algDeepSearch.Name := 'rb_algDeepSearch';
        self.rb_algDeepSearch.Size := new System.Drawing.Size(182, 24);
        self.rb_algDeepSearch.TabIndex := 0;
        self.rb_algDeepSearch.Text := 'Поиск в глубину';
        self.rb_algDeepSearch.UseVisualStyleBackColor := true;
        self.rb_algDeepSearch.MouseClick += rb_algDeepSearch_MouseClick;
        // 
        // rb_cell5
        // 
        self.rb_cell5.Checked := true;
        self.rb_cell5.Location := new System.Drawing.Point(21, 28);
        self.rb_cell5.Name := 'rb_cell5';
        self.rb_cell5.Size := new System.Drawing.Size(142, 24);
        self.rb_cell5.TabIndex := 0;
        self.rb_cell5.TabStop := true;
        self.rb_cell5.Text := 'Точка начала';
        self.rb_cell5.UseVisualStyleBackColor := true;
        self.rb_cell5.MouseClick += rb_cell5_MouseClick;
        // 
        // rb_cell6
        // 
        self.rb_cell6.Location := new System.Drawing.Point(21, 58);
        self.rb_cell6.Name := 'rb_cell6';
        self.rb_cell6.Size := new System.Drawing.Size(142, 24);
        self.rb_cell6.TabIndex := 0;
        self.rb_cell6.Text := 'Точка конца';
        self.rb_cell6.UseVisualStyleBackColor := true;
        self.rb_cell6.MouseClick += rb_cell6_MouseClick;
        // 
        // rb_cell1
        // 
        self.rb_cell1.Location := new System.Drawing.Point(21, 88);
        self.rb_cell1.Name := 'rb_cell1';
        self.rb_cell1.Size := new System.Drawing.Size(142, 24);
        self.rb_cell1.TabIndex := 0;
        self.rb_cell1.Text := 'Преграда';
        self.rb_cell1.UseVisualStyleBackColor := true;
        self.rb_cell1.MouseClick += rb_cell1_MouseClick;
        // 
        // groupBox_Algorithms
        // 
        self.groupBox_Algorithms.Controls.Add(self.rb_algAStar);
        self.groupBox_Algorithms.Controls.Add(self.rb_algDejkstra);
        self.groupBox_Algorithms.Controls.Add(self.rb_algWidthSearch);
        self.groupBox_Algorithms.Controls.Add(self.rb_algDeepSearch);
        self.groupBox_Algorithms.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.groupBox_Algorithms.Location := new System.Drawing.Point(37, 367);
        self.groupBox_Algorithms.Name := 'groupBox_Algorithms';
        self.groupBox_Algorithms.Size := new System.Drawing.Size(209, 153);
        self.groupBox_Algorithms.TabIndex := 2;
        self.groupBox_Algorithms.TabStop := false;
        self.groupBox_Algorithms.Text := 'Алгоритмы';
        // 
        // groupBox_CellTypes
        // 
        self.groupBox_CellTypes.Controls.Add(self.rb_cell6);
        self.groupBox_CellTypes.Controls.Add(self.rb_cell5);
        self.groupBox_CellTypes.Controls.Add(self.rb_cell0);
        self.groupBox_CellTypes.Controls.Add(self.rb_cell1);
        self.groupBox_CellTypes.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.groupBox_CellTypes.Location := new System.Drawing.Point(37, 12);
        self.groupBox_CellTypes.Name := 'groupBox_CellTypes';
        self.groupBox_CellTypes.Size := new System.Drawing.Size(209, 160);
        self.groupBox_CellTypes.TabIndex := 1;
        self.groupBox_CellTypes.TabStop := false;
        self.groupBox_CellTypes.Text := 'Ячейки';
        // 
        // rb_cell0
        // 
        self.rb_cell0.Location := new System.Drawing.Point(21, 118);
        self.rb_cell0.Name := 'rb_cell0';
        self.rb_cell0.Size := new System.Drawing.Size(142, 24);
        self.rb_cell0.TabIndex := 0;
        self.rb_cell0.Text := 'Ластик';
        self.rb_cell0.UseVisualStyleBackColor := true;
        self.rb_cell0.MouseClick += rb_cell0_MouseClick;
        // 
        // b_Act_Pause
        // 
        self.b_Act_Pause.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.b_Act_Pause.Location := new System.Drawing.Point(37, 246);
        self.b_Act_Pause.Name := 'b_Act_Pause';
        self.b_Act_Pause.Size := new System.Drawing.Size(209, 33);
        self.b_Act_Pause.TabIndex := 4;
        self.b_Act_Pause.Text := 'Запустить';
        self.b_Act_Pause.UseVisualStyleBackColor := true;
        self.b_Act_Pause.Click += b_Act_Pause_Click;
        // 
        // b_Stop
        // 
        self.b_Stop.Enabled := false;
        self.b_Stop.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.b_Stop.Location := new System.Drawing.Point(37, 285);
        self.b_Stop.Name := 'b_Stop';
        self.b_Stop.Size := new System.Drawing.Size(209, 33);
        self.b_Stop.TabIndex := 4;
        self.b_Stop.Text := 'Прекратить';
        self.b_Stop.UseVisualStyleBackColor := true;
        self.b_Stop.Click += b_Stop_Click;
        // 
        // b_DoStep
        // 
        self.b_DoStep.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.b_DoStep.Location := new System.Drawing.Point(37, 324);
        self.b_DoStep.Name := 'b_DoStep';
        self.b_DoStep.Size := new System.Drawing.Size(209, 37);
        self.b_DoStep.TabIndex := 4;
        self.b_DoStep.Text := 'Выполнить шаг';
        self.b_DoStep.UseVisualStyleBackColor := true;
        self.b_DoStep.Click += b_DoStep_Click;
        // 
        // b_ClearGrid
        // 
        self.b_ClearGrid.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.b_ClearGrid.Location := new System.Drawing.Point(37, 187);
        self.b_ClearGrid.Name := 'b_ClearGrid';
        self.b_ClearGrid.Size := new System.Drawing.Size(209, 37);
        self.b_ClearGrid.TabIndex := 4;
        self.b_ClearGrid.Text := 'Очистить поле';
        self.b_ClearGrid.UseVisualStyleBackColor := true;
        self.b_ClearGrid.Click += b_ClearGrid_Click;
        // 
        // b_Exit
        // 
        self.b_Exit.Font := new System.Drawing.Font('Microsoft Sans Serif', 9, System.Drawing.FontStyle.Bold);
        self.b_Exit.Location := new System.Drawing.Point(37, 764);
        self.b_Exit.Name := 'b_Exit';
        self.b_Exit.Size := new System.Drawing.Size(209, 37);
        self.b_Exit.TabIndex := 4;
        self.b_Exit.Text := 'Выйти';
        self.b_Exit.UseVisualStyleBackColor := true;
        self.b_Exit.Click += b_Exit_Click;
        // 
        // rb_speed1
        // 
        self.rb_speed1.CheckAlign := System.Drawing.ContentAlignment.TopCenter;
        self.rb_speed1.Location := new System.Drawing.Point(26, 21);
        self.rb_speed1.Name := 'rb_speed1';
        self.rb_speed1.Size := new System.Drawing.Size(35, 46);
        self.rb_speed1.TabIndex := 5;
        self.rb_speed1.Text := '1';
        self.rb_speed1.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.rb_speed1.UseVisualStyleBackColor := true;
        self.rb_speed1.MouseClick += rb_speed1_MouseClick;
        // 
        // rb_speed2
        // 
        self.rb_speed2.CheckAlign := System.Drawing.ContentAlignment.TopCenter;
        self.rb_speed2.Checked := true;
        self.rb_speed2.Location := new System.Drawing.Point(88, 21);
        self.rb_speed2.Name := 'rb_speed2';
        self.rb_speed2.Size := new System.Drawing.Size(35, 46);
        self.rb_speed2.TabIndex := 5;
        self.rb_speed2.TabStop := true;
        self.rb_speed2.Text := '2';
        self.rb_speed2.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.rb_speed2.UseVisualStyleBackColor := true;
        self.rb_speed2.MouseClick += rb_speed2_MouseClick;
        // 
        // rb_speed3
        // 
        self.rb_speed3.CheckAlign := System.Drawing.ContentAlignment.TopCenter;
        self.rb_speed3.Location := new System.Drawing.Point(147, 21);
        self.rb_speed3.Name := 'rb_speed3';
        self.rb_speed3.Size := new System.Drawing.Size(35, 46);
        self.rb_speed3.TabIndex := 5;
        self.rb_speed3.Text := '3';
        self.rb_speed3.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.rb_speed3.UseVisualStyleBackColor := true;
        self.rb_speed3.MouseClick += rb_speed3_MouseClick;
        // 
        // groupBox_animSpeed
        // 
        self.groupBox_animSpeed.Controls.Add(self.rb_speed1);
        self.groupBox_animSpeed.Controls.Add(self.rb_speed2);
        self.groupBox_animSpeed.Controls.Add(self.rb_speed3);
        self.groupBox_animSpeed.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.groupBox_animSpeed.Location := new System.Drawing.Point(37, 526);
        self.groupBox_animSpeed.Name := 'groupBox_animSpeed';
        self.groupBox_animSpeed.Size := new System.Drawing.Size(209, 73);
        self.groupBox_animSpeed.TabIndex := 6;
        self.groupBox_animSpeed.TabStop := false;
        self.groupBox_animSpeed.Text := 'Скорость анимации';
        // 
        // label_Path
        // 
        self.label_Path.Font := new System.Drawing.Font('Microsoft Sans Serif', 9, System.Drawing.FontStyle.Bold);
        self.label_Path.Location := new System.Drawing.Point(6, 66);
        self.label_Path.Name := 'label_Path';
        self.label_Path.Size := new System.Drawing.Size(117, 23);
        self.label_Path.TabIndex := 7;
        self.label_Path.Text := 'Длина пути:';
        self.label_Path.TextAlign := System.Drawing.ContentAlignment.TopRight;
        // 
        // label_CellsResearched
        // 
        self.label_CellsResearched.Font := new System.Drawing.Font('Microsoft Sans Serif', 9, System.Drawing.FontStyle.Bold);
        self.label_CellsResearched.Location := new System.Drawing.Point(6, 89);
        self.label_CellsResearched.Name := 'label_CellsResearched';
        self.label_CellsResearched.Size := new System.Drawing.Size(117, 41);
        self.label_CellsResearched.TabIndex := 7;
        self.label_CellsResearched.Text := 'Исследовано'#13#10'клеток:';
        self.label_CellsResearched.TextAlign := System.Drawing.ContentAlignment.TopRight;
        // 
        // label_PathInfo
        // 
        self.label_PathInfo.Font := new System.Drawing.Font('Microsoft Sans Serif', 9, System.Drawing.FontStyle.Bold);
        self.label_PathInfo.Location := new System.Drawing.Point(121, 66);
        self.label_PathInfo.Name := 'label_PathInfo';
        self.label_PathInfo.Size := new System.Drawing.Size(82, 23);
        self.label_PathInfo.TabIndex := 7;
        // 
        // label_CellsResearchedInfo
        // 
        self.label_CellsResearchedInfo.Font := new System.Drawing.Font('Microsoft Sans Serif', 9, System.Drawing.FontStyle.Bold);
        self.label_CellsResearchedInfo.Location := new System.Drawing.Point(121, 98);
        self.label_CellsResearchedInfo.Name := 'label_CellsResearchedInfo';
        self.label_CellsResearchedInfo.Size := new System.Drawing.Size(82, 23);
        self.label_CellsResearchedInfo.TabIndex := 7;
        // 
        // timer
        // 
        self.timer.Enabled := true;
        self.timer.Interval := 1;
        self.timer.Tick += timer_Tick;
        // 
        // groupBox_Result
        // 
        self.groupBox_Result.Controls.Add(self.label_Info);
        self.groupBox_Result.Controls.Add(self.label_Path);
        self.groupBox_Result.Controls.Add(self.label_CellsResearchedInfo);
        self.groupBox_Result.Controls.Add(self.label_CellsResearched);
        self.groupBox_Result.Controls.Add(self.label_PathInfo);
        self.groupBox_Result.Location := new System.Drawing.Point(37, 605);
        self.groupBox_Result.Name := 'groupBox_Result';
        self.groupBox_Result.Size := new System.Drawing.Size(209, 136);
        self.groupBox_Result.TabIndex := 8;
        self.groupBox_Result.TabStop := false;
        self.groupBox_Result.Visible := false;
        // 
        // label_Info
        // 
        self.label_Info.Location := new System.Drawing.Point(6, 20);
        self.label_Info.Name := 'label_Info';
        self.label_Info.Size := new System.Drawing.Size(197, 38);
        self.label_Info.TabIndex := 8;
        self.label_Info.Text := 'Длина шага напрямую 10, по диагонали 14';
        // 
        // Form_Settings
        // 
        self.ClientSize := new System.Drawing.Size(282, 813);
        self.Controls.Add(self.groupBox_Result);
        self.Controls.Add(self.b_ClearGrid);
        self.Controls.Add(self.b_Exit);
        self.Controls.Add(self.b_DoStep);
        self.Controls.Add(self.b_Stop);
        self.Controls.Add(self.b_Act_Pause);
        self.Controls.Add(self.groupBox_CellTypes);
        self.Controls.Add(self.groupBox_Algorithms);
        self.Controls.Add(self.groupBox_animSpeed);
        self.Font := new System.Drawing.Font('Microsoft Sans Serif', 9);
        self.FormBorderStyle := System.Windows.Forms.FormBorderStyle.FixedToolWindow;
        self.Location := new System.Drawing.Point(150, 100);
        self.Name := 'Form_Settings';
        self.StartPosition := System.Windows.Forms.FormStartPosition.Manual;
        self.Text := 'Параметры';
        self.Shown += Form_Settings_Shown;
        self.groupBox_Algorithms.ResumeLayout(false);
        self.groupBox_CellTypes.ResumeLayout(false);
        self.groupBox_animSpeed.ResumeLayout(false);
        self.groupBox_Result.ResumeLayout(false);
        self.ResumeLayout(false);
    end;
