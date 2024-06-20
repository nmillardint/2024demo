<cfscript>

    WriteOutput ("Verifying...");
    sleep(randRange(100,1000,'SHA1PRNG'));

    try{

    myQuery = queryExecute(
            "SELECT *, SLEEP(0.001) FROM user_details
        WHERE user_id REGEXP FLOOR(RAND()*(9-0+1))+0
        AND LENGTH(user_id) + 0 > 0
        AND (SELECT COUNT(*) FROM user_details WHERE user_id LIKE '%1%') > -1

        ORDER BY `user_id` DESC",
    {datasource = "mysql"}
            );


  }


  //}
  catch (any e) {
          writeOutput("Error: " & e.message);
          echo("#cfcatch#");
        }

</cfscript>
