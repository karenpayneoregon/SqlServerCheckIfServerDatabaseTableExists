Public Class Form1
    Private ReadOnly ops As New DataOperations
    Private bsReports As New BindingSource

    ''' <summary>
    ''' Setup data sources and subscribe to our events
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Async Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        Label1.Text = ""
        Dim reportList As List(Of Report)

        If ops.LoadWithCheck Then
            AdvancedPanel1.Dispose()
            reportList = ops.GetReportList
        Else
            reportList = Await ops.GetReportListAsync

            AdvancedPanel1.Dispose()

            If ops.HasException Then
                ops.RemoveConfirmationFile()
                ActiveControl = closeApplicationButton
                MessageBox.Show(ops.DiagnosticErrors)
                Exit Sub
            End If

            If ops.HasException Then
                ops.RemoveConfirmationFile()
                ActiveControl = closeApplicationButton
                MessageBox.Show($"Error: {ops.LastException.Message}")
                Exit Sub
            End If

            If Not ops.RequiredTablesAvailable Then
                ops.RemoveConfirmationFile()
                ActiveControl = closeApplicationButton
                MessageBox.Show($"Contact support with error code A1027Y{Environment.NewLine}Press Ok to exit.")
                Exit Sub
            End If
        End If

        bsReports.DataSource = reportList
        ListBox1.DataSource = bsReports
        ListBox1.DisplayMember = "Name"

        txtSqlStatement.DataBindings.Add("Text", bsReports, "Statement")
        Label1.DataBindings.Add("Text", bsReports, "Description")


        AddHandler bsReports.PositionChanged, AddressOf PositonChanged
        GetParameters(CType(bsReports.Current, Report).StatementId)

        executeScriptButton.Enabled = True
        GetDataSynchronouslyButton.Enabled = True
        cmdRemoveConfirmationFile.Enabled = True

        ops.WriteConfirmation()

    End Sub
    ''' <summary>
    ''' Normal method to read data
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub GetDataSynchronouslyButton_Click(sender As Object, e As EventArgs) Handles GetDataSynchronouslyButton.Click

        RemoveHandler bsReports.PositionChanged, AddressOf PositonChanged

        ListBox1.DataSource = Nothing
        bsReports = New BindingSource()
        bsReports.DataSource = Nothing
        DataGridView1.DataSource = Nothing

        If txtSqlStatement.DataBindings.Count > 0 Then
            txtSqlStatement.DataBindings.Clear()
        End If

        txtSqlStatement.Text = ""

        If Label1.DataBindings.Count > 0 Then
            Label1.DataBindings.Clear()
        End If

        MessageBox.Show("Clear")

        Dim reportList As List(Of Report)

        reportList = ops.GetReportList
        bsReports.DataSource = reportList
        ListBox1.DataSource = bsReports
        ListBox1.DisplayMember = "Name"

        txtSqlStatement.DataBindings.Add("Text", bsReports, "Statement")
        Label1.DataBindings.Add("Text", bsReports, "Description")


        AddHandler bsReports.PositionChanged, AddressOf PositonChanged
        GetParameters(CType(bsReports.Current, Report).StatementId)


    End Sub
    ''' <summary>
    ''' Get current SQL statement for current row.
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub PositonChanged(sender As Object, e As EventArgs)
        GetParameters(CType(bsReports.Current, Report).StatementId)
    End Sub
    ''' <summary>
    ''' Get parameters for selected report with values
    ''' </summary>
    ''' <param name="pId">Statement primary key</param>
    Private Sub GetParameters(pId As Integer)
        DataGridView1.Rows.Clear()
        Dim params = ops.Parameters(pId)

        For Each p As StatementParameter In params
            DataGridView1.Rows.Add(New Object() {p.Name, p.Value})
        Next

    End Sub
    ''' <summary>
    ''' Pass query, parameters with values to create SELECT statement and run
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub executeScriptButton_Click(sender As Object, e As EventArgs) Handles executeScriptButton.Click

        Dim paramList As New List(Of StatementParameter)

        Try
            For Each row As DataGridViewRow In DataGridView1.Rows

                paramList.Add(New StatementParameter With
                {
                  .Name = row.Cells(0).Value.ToString,
                  .Value = row.Cells(1).Value
                })

            Next
        Catch ex As Exception
            MessageBox.Show($"Encounter a problem with a parameter name and/or value.{Environment.NewLine}{ex.Message}")
            Exit Sub
        End Try

        Dim f As New ResultsForm

        If Not ops.HasException Then
            f.DataGridView1.DataSource = ops.Execute(txtSqlStatement.Text, paramList)

            Try
                f.ShowDialog()
            Finally
                f.Dispose()
            End Try
        Else
            MessageBox.Show(ops.LastException.Message)
        End If

    End Sub
    Private Sub cmdRemoveConfirmationFile_Click(sender As Object, e As EventArgs) Handles cmdRemoveConfirmationFile.Click
        ops.RemoveConfirmationFile()
    End Sub
    Private Sub closeApplicationButton_Click(sender As Object, e As EventArgs) Handles closeApplicationButton.Click
        Close()
    End Sub
End Class
