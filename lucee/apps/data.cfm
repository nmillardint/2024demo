<cfscript>
    // Define the datasource name
    datasource = "mysql";

    // Query to get all table names in the database
    getTablesQuery = "SHOW TABLES";

    // Execute the query to get all table names
    tablesResult = queryExecute(getTablesQuery, [], {datasource = datasource});
</cfscript>

<cfoutput>
    <h2>Data from all tables in mysql database</h2>
    <cfloop query="tablesResult">
        <!-- The column name from SHOW TABLES is typically 'Tables_in_customerdatabase' -->
        <cfset tableName = tablesResult["Tables_in_customerdatabase"][currentRow]>
        <h3>Data from #tableName#</h3>
        <cfscript>
            // Query to get all data from the current table
            sqlQuery = "SELECT * FROM " & tableName;
            
            // Execute the query
            result = queryExecute(sqlQuery, [], {datasource = datasource});
        </cfscript>
        <table border="1">
            <thead>
                <tr>
                    <!-- Dynamically output column names -->
                    <cfloop list="#result.columnList#" index="column">
                        <th>#column#</th>
                    </cfloop>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through the query result and output each row -->
                <cfloop query="result">
                    <tr>
                        <cfloop list="#result.columnList#" index="column">
                            <td>#result[column][currentRow]#</td>
                        </cfloop>
                    </tr>
                </cfloop>
            </tbody>
        </table>
        <br>
    </cfloop>
</cfoutput>
