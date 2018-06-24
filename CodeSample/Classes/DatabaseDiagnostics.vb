Imports SqlServerCheckLibrary

Namespace Classes
    Public Class DatabaseDiagnostics
        Private _mHasException As Boolean
        Public ReadOnly Property HasException As Boolean
            Get
                Return _mHasException
            End Get
        End Property
        Private _mException As Exception
        Public ReadOnly Property LastException As Exception
            Get
                Return _mException
            End Get
        End Property

        Private _mServerName As String
        Private _mCatalog As String

        Private _mErrors As String
        Public ReadOnly Property Errors As String
            Get
                Return _mErrors
            End Get
        End Property
        Private _mTableNames As List(Of String)
        Public ReadOnly Property TableNames As List(Of String)
            Get
                Return _mTableNames
            End Get
        End Property
        ''' <summary>
        ''' Check if server, database and tables exists.
        ''' </summary>
        ''' <param name="pServerName">Server name to check if exists</param>
        ''' <param name="pCatalog">Catalog to check if exists on pServerName</param>
        Public Sub New(pServerName As String, pCatalog As String)
            _mServerName = pServerName
            _mCatalog = pCatalog
        End Sub
        Public Async Function Check() As Task(Of Boolean)

            Try
                Dim checker As New Utilities

                If Not Await checker.SqlServerIsAvailableAsync(_mServerName) Then
                    _mErrors = $"Server '{_mServerName}' not found."
                    _mHasException = True
                    Return False
                End If

                If Not Await checker.DatabaseExistsAsync(_mServerName, _mCatalog) Then
                    _mErrors = $"'{_mServerName}.{_mCatalog}' table not found"
                    _mHasException = True
                    Return False
                End If

                _mTableNames = checker.TableNames(_mServerName, _mCatalog)

            Catch ex As Exception
                _mHasException = True
                _mException = ex
                _mErrors = ex.Message
                Return False
            End Try


            Return True

        End Function

    End Class
End Namespace