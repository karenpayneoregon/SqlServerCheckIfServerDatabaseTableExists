Namespace Classes
    Public MustInherit Class BaseSqlServerConnection
        Inherits BaseExceptionsHandler
        ''' <summary>
        ''' This points to your database server - change to match
        ''' your server.
        ''' </summary>
        Protected Server As String = "KARENS-PC"
        ''' <summary>
        ''' Name of database containing required tables
        ''' </summary>
        Protected DefaultCatalog As String = "NorthWindAzure"
        Protected ConfirmationFileName As String =
                      IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Database.txt")
        Public ReadOnly Property LoadWithCheck As Boolean
            Get
                Return IO.File.Exists(ConfirmationFileName)
            End Get
        End Property
        Public Function WriteConfirmation() As Boolean
            Try
                IO.File.WriteAllText(ConfirmationFileName, "")
                Return True
            Catch ex As Exception
                Return False
            End Try
        End Function
        Public Function RemoveConfirmationFile() As ConfirmationRemove
            If IO.File.Exists(ConfirmationFileName) Then
                Try
                    IO.File.Delete(ConfirmationFileName)
                    Return ConfirmationRemove.Successful
                Catch e As Exception
                    mHasException = True
                    mException = e
                    Return ConfirmationRemove.Failed
                End Try
            End If

            Return ConfirmationRemove.FileNotFound

        End Function

        Public ReadOnly Property ConnectionString() As String
            Get
                Return $"Data Source={Server};Initial Catalog={DefaultCatalog};Integrated Security=True"
            End Get
        End Property
    End Class
End Namespace