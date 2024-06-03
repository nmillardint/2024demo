<!-- save this as unsupported_tags.cfm -->

<!DOCTYPE html>
<html>
<head>
    <title>CFML File with Unsupported Lucee Tags</title>
</head>
<body>
    <h1>CFML File with Tags Unsupported by Lucee</h1>

    <!-- cfdocument example -->
    <cfdocument format="PDF" filename="example.pdf">
        <cfdocumentitem type="header">
            <h1>Example PDF Document</h1>
        </cfdocumentitem>
        <cfdocumentitem type="body">
            <p>This is an example of a PDF document created using the cfdocument tag.</p>
        </cfdocumentitem>
    </cfdocument>

    <!-- cfhtmltopdf example -->
    <cfhtmltopdf destination="example2.pdf">
        <h1>Example HTML to PDF</h1>
        <p>This PDF is generated from HTML using the cfhtmltopdf tag.</p>
    </cfhtmltopdf>

    <!-- cfclient example -->
    <cfclient>
        <cfclientsettings enableCaching="true" />
        <cfsavecontent variable="clientData">
            <h1>Hello, CFClient</h1>
            <p>This content is rendered using the cfclient tag.</p>
        </cfsavecontent>
        <cfoutput>#clientData#</cfoutput>
    </cfclient>

    <!-- cfchart example -->
    <cfchart format="png" chartHeight="300" chartWidth="400" title="Sales Data">
        <cfchartseries type="bar">
            <cfchartdata item="Q1" value="10000" />
            <cfchartdata item="Q2" value="12000" />
            <cfchartdata item="Q3" value="18000" />
            <cfchartdata item="Q4" value="20000" />
        </cfchartseries>
    </cfchart>

    <!-- cfexchange example -->
    <cfexchangeconnection
        action="open"
        connection="exchangeServer"
        username="user@example.com"
        password="password"
        server="https://exchange.example.com"
    />
    <cfexchangefilter name="inbox">
        <cfexchangecalendar action="get" name="calendar">
            <cfexchangeparam name="startdate" value="#now()#" />
            <cfexchangeparam name="enddate" value="#dateAdd('d', 7, now())#" />
        </cfexchangecalendar>
    </cfexchangefilter>
</body>
</html>

