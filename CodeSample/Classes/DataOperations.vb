Imports System.Data.SqlClient
Imports WindowsApplication1.Classes

Public Class DataOperations
    Inherits BaseSqlServerConnection

    'Private mDiagnosticErrors As String
    'Public ReadOnly Property DiagnosticErrors() As String
    '    Get
    '        Return mDiagnosticErrors
    '    End Get
    'End Property
    Private mAvailableTableNames As List(Of String)
    ''' <summary>
    ''' All tables in our Catalog
    ''' </summary>
    ''' <returns></returns>
    Public ReadOnly Property AvailableTableNames As List(Of String)
        Get
            Return mAvailableTableNames
        End Get
    End Property
    ''' <summary>
    ''' Table names required for use in the operatons in this code sample
    ''' </summary>
    ''' <returns></returns>
    Public ReadOnly Property RequiredTableList As List(Of String)
        Get
            Return New List(Of String) From {"Report", "ReportParameters", "ReportStatements"}
        End Get
    End Property
    ''' <summary>
    ''' Get all reports
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks>
    ''' First checks to see if the server and database exists.
    ''' </remarks>
    Public Async Function GetReportListAsync() As Task(Of List(Of Report))
        mHasException = False

        Dim reportList As New List(Of Report)

        ' this section checks to see if the server and catalog exists
        Dim diag As New DatabaseDiagnostics(Server, DefaultCatalog)

        If Not Await diag.Check Then

            If Not String.IsNullOrWhiteSpace(diag.Errors) Then
                mDiagnosticErrors = diag.Errors
                mHasException = True
            End If

            If diag.HasException Then
                mDiagnosticErrors = diag.Errors
                mHasException = True
            End If
            Return reportList
        Else
            ' get table names
            mAvailableTableNames = diag.TableNames

            ReportListTablesAvailable()

            Using cn As New SqlConnection With {.ConnectionString = ConnectionString}
                Using cmd As New SqlCommand With {.Connection = cn}
                    cmd.CommandText =
                        <SQL>
                    SELECT 
                        r.id, r.Name, 
                        r.Description, 
                        rs.Statement, 
                        rs.id  
                    FROM 
                        Report AS r INNER JOIN ReportStatements AS rs ON r.id = rs.ReportId
                </SQL>.Value

                    Try
                        cn.Open()

                        Dim reader As SqlDataReader = cmd.ExecuteReader

                        While reader.Read

                            reportList.Add(New Report With
                            {
                                .Id = reader.GetInt32(0),
                                .Name = reader.GetString(1),
                                .Description = reader.GetString(2),
                                .Statement = reader.GetString(3),
                                .StatementId = reader.GetInt32(4)
                            })


                        End While

                    Catch ex As Exception
                        mHasException = True
                        mException = ex
                    End Try

                End Using
            End Using


        End If

        Return reportList

    End Function
    Public Function GetReportList() As List(Of Report)
        mHasException = False

        Dim reportList As New List(Of Report)


        ' this section checks to see if the server and catalog exists
        Dim diag As New DatabaseDiagnostics(Server, DefaultCatalog)


        ' get table names
        mAvailableTableNames = diag.TableNames

        Using cn As New SqlConnection With {.ConnectionString = ConnectionString}
            Using cmd As New SqlCommand With {.Connection = cn}
                cmd.CommandText =
                        <SQL>
                    SELECT 
                        r.id, r.Name, 
                        r.Description, 
                        rs.Statement, 
                        rs.id  
                    FROM 
                        Report AS r INNER JOIN ReportStatements AS rs ON r.id = rs.ReportId
                </SQL>.Value

                Try
                    cn.Open()

                    Dim reader As SqlDataReader = cmd.ExecuteReader

                    While reader.Read

                        reportList.Add(New Report With
                            {
                                .Id = reader.GetInt32(0),
                                .Name = reader.GetString(1),
                                .Description = reader.GetString(2),
                                .Statement = reader.GetString(3),
                                .StatementId = reader.GetInt32(4)
                            })


                    End While

                Catch ex As Exception
                    mHasException = True
                    mException = ex
                End Try

            End Using
        End Using


        Return reportList

    End Function

    ''' <summary>
    ''' Get parameters for selected SQL SELECT statement
    ''' </summary>
    ''' <param name="pId"></param>
    ''' <returns></returns>
    Public Function Parameters(pId As Integer) As List(Of StatementParameter)
        mHasException = False

        Dim paramList As New List(Of StatementParameter)

        Using cn As New SqlConnection With {.ConnectionString = ConnectionString}
            Using cmd As New SqlCommand With {.Connection = cn}
                cmd.CommandText =
                    <SQL>
                        SELECT 
                            rs.id, 
                            rs.ReportId, 
                            rs.Statement, 
                            ReportParameters.ParameterName, 
                            ReportParameters.ParameterValue 
                        FROM  
                            ReportStatements AS rs INNER JOIN ReportParameters ON rs.id = ReportParameters.StatementId 
                        WHERE (rs.id = @Id)
                    </SQL>.Value

                cmd.Parameters.AddWithValue("@Id", pId)

                Try
                    cn.Open()

                    Dim reader As SqlDataReader = cmd.ExecuteReader
                    If reader.HasRows Then
                        While reader.Read
                            paramList.Add(New StatementParameter With {.Name = reader.GetString(3), .Value = reader.GetSqlValue(4)})
                        End While
                    End If

                Catch ex As Exception
                    mHasException = True
                    mException = ex
                End Try

            End Using
        End Using

        Return paramList

    End Function
    ''' <summary>
    ''' Create dynamic SQL SELECT with passed in parameters and values
    ''' </summary>
    ''' <param name="pStatement"></param>
    ''' <param name="pParamList"></param>
    ''' <returns></returns>
    Public Function Execute(pStatement As String, pParamList As List(Of StatementParameter)) As DataTable
        mHasException = False

        Dim dt As New DataTable

        Using cn As New SqlConnection With {.ConnectionString = ConnectionString}
            Using cmd As New SqlCommand With {.Connection = cn, .CommandText = pStatement}

                For Each param As StatementParameter In pParamList
                    cmd.Parameters.AddWithValue(param.Name, param.Value)
                Next

                Try

                    cn.Open()

                    dt.Load(cmd.ExecuteReader)

                Catch ex As Exception
                    mHasException = True
                    mException = ex
                End Try

            End Using
        End Using

        Return dt

    End Function
    ''' <summary>
    ''' Check to see if two table are available for obtaining report data.
    ''' </summary>
    Private Sub ReportListTablesAvailable()
        If (Not mAvailableTableNames.Contains("Report")) OrElse (Not mAvailableTableNames.Contains("ReportParameters")) Then
            Throw New Exception("Missing one or more tables, Report and or ReportParameters")
        End If
    End Sub
    Public Function RequiredTablesAvailable() As Boolean

        For Each tableName As String In RequiredTableList

            If Not mAvailableTableNames.Contains(tableName) Then
                Return False
            End If

        Next

        Return True

    End Function
End Class

