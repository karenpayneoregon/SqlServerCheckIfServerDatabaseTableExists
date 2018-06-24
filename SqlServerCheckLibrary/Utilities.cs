using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace SqlServerCheckLibrary
{
    /// <summary>
    /// Permits checking if a server and database exists.
    /// </summary>
    public class Utilities
    {
        string _exceptionMessage;
        public string ExceptionMessage => _exceptionMessage;
        bool _hasException; 
        public bool HasException => _hasException;

        /// <summary>
        /// Determine if a specific SQL-Server is available
        /// </summary>
        /// <param name="pServerName">Server name to work with</param>
        /// <returns></returns>
        public async Task<bool> SqlServerIsAvailableAsync(string pServerName)
        {
            bool success = false;
            
            try
            {

                await Task.Run(() =>
                {
                    var sqlDataSourceEnumeratorInstance = SqlDataSourceEnumerator.Instance;
                    var dt = sqlDataSourceEnumeratorInstance.GetDataSources();
                    if (dt != null)
                    {
                        if (dt.Rows.Count > 0)
                        {
                            var row = dt
                                .AsEnumerable()
                                .FirstOrDefault
                                    (
                                        dataRow => dataRow.Field<string>("ServerName") == pServerName.ToUpper()
                                    );

                            success = row != null;
                        }
                        else
                        {
                            success = false;
                        }
                    }
                }).ConfigureAwait(false);

            }
            catch (Exception ex)
            {
                _hasException = true;
                _exceptionMessage = ex.Message;
            }

            return success;

        }
        /// <summary>
        /// Determines if a catalog/database exist on a specific instance of SQL-Server
        /// </summary>
        /// <param name="pServer"></param>
        /// <param name="pDatabase"></param>
        /// <returns></returns>
        public async Task<bool> DatabaseExistsAsync(string pServer, string pDatabase)
        {
            bool success = false;
            var testServer = await SqlServerIsAvailableAsync(pServer).ConfigureAwait(false);
            if (!testServer)
            {
                return false;
            }

            try
            {
                var connectionString = ("Data Source=" + (pServer + ";Initial Catalog=master;" + 
                                                          "Integrated Security=True;"));
                var commandText = 
                    ("select * from master.dbo.sysdatabases where name='" + (pDatabase + "'"));

                using (var cn = new SqlConnection { ConnectionString = connectionString })
                {
                    using (var cmd = new SqlCommand { Connection = cn, CommandText = commandText })
                    {
                        cn.Open();
                        var reader = await cmd.ExecuteReaderAsync().ConfigureAwait(false);
                        success = reader.HasRows;
                    }
                }
            }
            catch (Exception e)
            {
                _hasException = true;
                _exceptionMessage = e.Message;
            }

            return success;

        }
        /// <summary>
        /// Get table names for a database that exists on an available SQL-Server
        /// </summary>
        /// <param name="pServer">Server name</param>
        /// <param name="pDatabase">Database name</param>
        /// <returns></returns>
        public List<string> TableNames(string pServer, string pDatabase)
        {
            var tableNames = new List<string>();
            var connectionString = $"Data Source={pServer};Initial Catalog={pDatabase};Integrated Security=True";

            using (var cn = new SqlConnection { ConnectionString = connectionString })
            {
                using (var cmd = new SqlCommand() { Connection = cn })
                {
                    cmd.CommandText =
                            @"SELECT s.name, o.name
                              FROM sys.objects o WITH(NOLOCK)
                              JOIN sys.schemas s WITH(NOLOCK)
                              ON o.schema_id = s.schema_id
                              WHERE o.is_ms_shipped = 0 AND RTRIM(o.type) = 'U'
                              ORDER BY s.name ASC, o.name ASC";

                    cn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            var tableName = reader.GetString(1);
                            if (!tableName.Contains("sysdiagrams"))
                            {
                                tableNames.Add(tableName);
                            }

                        }
                    }
                }
            }

            return tableNames;
        }
    }
}
