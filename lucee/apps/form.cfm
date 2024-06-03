<!-- save this as scope_issues.cfm -->

<!DOCTYPE html>
<html>
<head>
    <title>CFML Scope Issues Example</title>
</head>
<body>
    <h1>CFML Scope Issues Example</h1>

    <!-- Define a variable in the VARIABLES scope -->
    <cfset Variables.myVar = "I am in the VARIABLES scope">

    <!-- Define a function that sets a variable with the same name -->
    <cfscript>
    function scopeTest() {
        // Setting a variable without specifying scope
        myVar = "I am in the LOCAL scope";
        // Accessing the variable in the current function scope
        writeOutput("Inside function scopeTest, myVar = " & myVar & "<br>");
    }

    // Call the function
    scopeTest();

    // Output the variable after function call
    writeOutput("Outside function scopeTest, myVar = " & Variables.myVar & "<br>");
    </cfscript>

    <hr>

    <!-- Demonstrating form variable behavior -->
    <cfif StructKeyExists(FORM, "submit")>
        <cfset formVar = FORM.formVar>
        <cfoutput>
            You submitted: #formVar#
        </cfoutput>
    </cfif>

    <form method="post">
        <label for="formVar">Enter a value:</label>
        <input type="text" name="formVar" id="formVar">
        <input type="submit" name="submit" value="Submit">
    </form>
</body>
</html>

