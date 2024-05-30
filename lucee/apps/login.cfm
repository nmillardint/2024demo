<cfscript>

  id=randRange(1,8,'SHA1PRNG')

  myQuery = queryExecute(
   "SELECT user_id FROM user_details
    WHERE username = :username
    AND password = 'abc123'",
    {username: 'username' & id},
    {datasource = "mysql"}
  );

  sleep(randRange(0,50,'SHA1PRNG')+100);

</cfscript>
