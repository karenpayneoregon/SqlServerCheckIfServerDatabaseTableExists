Imports WindowsApplication1.Controls

<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.SplitContainer1 = New System.Windows.Forms.SplitContainer()
        Me.ListBox1 = New System.Windows.Forms.ListBox()
        Me.AdvancedPanel1 = New BevelPanel.AdvancedPanel()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.DataGridView1 = New System.Windows.Forms.DataGridView()
        Me.NameColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ValueColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.txtSqlStatement = New System.Windows.Forms.TextBox()
        Me.PanelDockBottom1 = New WindowsApplication1.Controls.PanelDockBottom()
        Me.GetDataSynchronouslyButton = New System.Windows.Forms.Button()
        Me.closeApplicationButton = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.executeScriptButton = New System.Windows.Forms.Button()
        Me.cmdRemoveConfirmationFile = New System.Windows.Forms.Button()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer1.Panel1.SuspendLayout()
        Me.SplitContainer1.Panel2.SuspendLayout()
        Me.SplitContainer1.SuspendLayout()
        Me.AdvancedPanel1.SuspendLayout()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.PanelDockBottom1.SuspendLayout()
        Me.SuspendLayout()
        '
        'SplitContainer1
        '
        Me.SplitContainer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer1.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer1.Name = "SplitContainer1"
        '
        'SplitContainer1.Panel1
        '
        Me.SplitContainer1.Panel1.Controls.Add(Me.ListBox1)
        '
        'SplitContainer1.Panel2
        '
        Me.SplitContainer1.Panel2.Controls.Add(Me.AdvancedPanel1)
        Me.SplitContainer1.Panel2.Controls.Add(Me.DataGridView1)
        Me.SplitContainer1.Panel2.Controls.Add(Me.txtSqlStatement)
        Me.SplitContainer1.Size = New System.Drawing.Size(640, 214)
        Me.SplitContainer1.SplitterDistance = 213
        Me.SplitContainer1.TabIndex = 0
        '
        'ListBox1
        '
        Me.ListBox1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.ListBox1.FormattingEnabled = True
        Me.ListBox1.Location = New System.Drawing.Point(0, 0)
        Me.ListBox1.Name = "ListBox1"
        Me.ListBox1.Size = New System.Drawing.Size(213, 214)
        Me.ListBox1.TabIndex = 0
        '
        'AdvancedPanel1
        '
        Me.AdvancedPanel1.BackgroundGradientMode = BevelPanel.AdvancedPanel.PanelGradientMode.Vertical
        Me.AdvancedPanel1.Controls.Add(Me.Label2)
        Me.AdvancedPanel1.EdgeWidth = 2
        Me.AdvancedPanel1.EndColor = System.Drawing.Color.Black
        Me.AdvancedPanel1.FlatBorderColor = System.Drawing.Color.FromArgb(CType(CType(102, Byte), Integer), CType(CType(102, Byte), Integer), CType(CType(102, Byte), Integer))
        Me.AdvancedPanel1.Location = New System.Drawing.Point(13, 74)
        Me.AdvancedPanel1.Name = "AdvancedPanel1"
        Me.AdvancedPanel1.RectRadius = 5
        Me.AdvancedPanel1.ShadowColor = System.Drawing.Color.DimGray
        Me.AdvancedPanel1.ShadowShift = 2
        Me.AdvancedPanel1.ShadowStyle = BevelPanel.AdvancedPanel.ShadowMode.Dropped
        Me.AdvancedPanel1.Size = New System.Drawing.Size(341, 61)
        Me.AdvancedPanel1.StartColor = System.Drawing.Color.Silver
        Me.AdvancedPanel1.Style = BevelPanel.AdvancedPanel.BevelStyle.Raised
        Me.AdvancedPanel1.TabIndex = 1
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.Transparent
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.White
        Me.Label2.Location = New System.Drawing.Point(84, 16)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(173, 25)
        Me.Label2.TabIndex = 0
        Me.Label2.Text = "Loading data . . ."
        '
        'DataGridView1
        '
        Me.DataGridView1.AllowUserToAddRows = False
        Me.DataGridView1.AllowUserToDeleteRows = False
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.NameColumn, Me.ValueColumn})
        Me.DataGridView1.Location = New System.Drawing.Point(3, 100)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.Size = New System.Drawing.Size(417, 108)
        Me.DataGridView1.TabIndex = 2
        '
        'NameColumn
        '
        Me.NameColumn.HeaderText = "Param Name"
        Me.NameColumn.Name = "NameColumn"
        '
        'ValueColumn
        '
        Me.ValueColumn.HeaderText = "Value"
        Me.ValueColumn.Name = "ValueColumn"
        '
        'txtSqlStatement
        '
        Me.txtSqlStatement.Dock = System.Windows.Forms.DockStyle.Top
        Me.txtSqlStatement.Location = New System.Drawing.Point(0, 0)
        Me.txtSqlStatement.Multiline = True
        Me.txtSqlStatement.Name = "txtSqlStatement"
        Me.txtSqlStatement.Size = New System.Drawing.Size(423, 95)
        Me.txtSqlStatement.TabIndex = 0
        '
        'PanelDockBottom1
        '
        Me.PanelDockBottom1.Controls.Add(Me.cmdRemoveConfirmationFile)
        Me.PanelDockBottom1.Controls.Add(Me.GetDataSynchronouslyButton)
        Me.PanelDockBottom1.Controls.Add(Me.closeApplicationButton)
        Me.PanelDockBottom1.Controls.Add(Me.Label1)
        Me.PanelDockBottom1.Controls.Add(Me.executeScriptButton)
        Me.PanelDockBottom1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.PanelDockBottom1.Location = New System.Drawing.Point(0, 214)
        Me.PanelDockBottom1.Name = "PanelDockBottom1"
        Me.PanelDockBottom1.Size = New System.Drawing.Size(640, 70)
        Me.PanelDockBottom1.TabIndex = 1
        '
        'GetDataSynchronouslyButton
        '
        Me.GetDataSynchronouslyButton.Enabled = False
        Me.GetDataSynchronouslyButton.Location = New System.Drawing.Point(158, 35)
        Me.GetDataSynchronouslyButton.Name = "GetDataSynchronouslyButton"
        Me.GetDataSynchronouslyButton.Size = New System.Drawing.Size(140, 23)
        Me.GetDataSynchronouslyButton.TabIndex = 3
        Me.GetDataSynchronouslyButton.Text = "Get data synchronously"
        Me.GetDataSynchronouslyButton.UseVisualStyleBackColor = True
        '
        'closeApplicationButton
        '
        Me.closeApplicationButton.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.closeApplicationButton.Location = New System.Drawing.Point(553, 35)
        Me.closeApplicationButton.Name = "closeApplicationButton"
        Me.closeApplicationButton.Size = New System.Drawing.Size(75, 23)
        Me.closeApplicationButton.TabIndex = 2
        Me.closeApplicationButton.Text = "Exit"
        Me.closeApplicationButton.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(10, 11)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(39, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Label1"
        '
        'executeScriptButton
        '
        Me.executeScriptButton.Enabled = False
        Me.executeScriptButton.Location = New System.Drawing.Point(12, 35)
        Me.executeScriptButton.Name = "executeScriptButton"
        Me.executeScriptButton.Size = New System.Drawing.Size(140, 23)
        Me.executeScriptButton.TabIndex = 1
        Me.executeScriptButton.Text = "Run selected statement"
        Me.executeScriptButton.UseVisualStyleBackColor = True
        '
        'cmdRemoveConfirmationFile
        '
        Me.cmdRemoveConfirmationFile.Enabled = False
        Me.cmdRemoveConfirmationFile.Location = New System.Drawing.Point(304, 35)
        Me.cmdRemoveConfirmationFile.Name = "cmdRemoveConfirmationFile"
        Me.cmdRemoveConfirmationFile.Size = New System.Drawing.Size(140, 23)
        Me.cmdRemoveConfirmationFile.TabIndex = 4
        Me.cmdRemoveConfirmationFile.Text = "Remove confirmation file"
        Me.cmdRemoveConfirmationFile.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(640, 284)
        Me.Controls.Add(Me.SplitContainer1)
        Me.Controls.Add(Me.PanelDockBottom1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Code sample"
        Me.SplitContainer1.Panel1.ResumeLayout(False)
        Me.SplitContainer1.Panel2.ResumeLayout(False)
        Me.SplitContainer1.Panel2.PerformLayout()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.ResumeLayout(False)
        Me.AdvancedPanel1.ResumeLayout(False)
        Me.AdvancedPanel1.PerformLayout()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.PanelDockBottom1.ResumeLayout(False)
        Me.PanelDockBottom1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents PanelDockBottom1 As PanelDockBottom
    Friend WithEvents SplitContainer1 As SplitContainer
    Friend WithEvents ListBox1 As ListBox
    Friend WithEvents txtSqlStatement As TextBox
    Friend WithEvents DataGridView1 As DataGridView
    Friend WithEvents NameColumn As DataGridViewTextBoxColumn
    Friend WithEvents ValueColumn As DataGridViewTextBoxColumn
    Friend WithEvents executeScriptButton As Button
    Friend WithEvents Label1 As Label
    Friend WithEvents closeApplicationButton As Button
    Friend WithEvents AdvancedPanel1 As BevelPanel.AdvancedPanel
    Friend WithEvents Label2 As Label
    Friend WithEvents GetDataSynchronouslyButton As Button
    Friend WithEvents cmdRemoveConfirmationFile As Button
End Class
