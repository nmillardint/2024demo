<cfscript>

  myQuery = queryExecute(
   "SELECT * FROM user_details
      WHERE user_id = :id",
      {id: randRange(1,22000,'SHA1PRNG')},
      {datasource = "mysql"}
    );

  dur = randRange(0,75,'SHA1PRNG')+100;
  sleep(dur);
</cfscript>

