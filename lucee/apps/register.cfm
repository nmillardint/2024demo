<cfscript>

  sleep(randRange(0,50,'SHA1PRNG')+100);

  myQuery = queryExecute(
   "INSERT INTO user_details
      (username, first_name, last_name, gender, password, status)
      VALUES (:username, 'bob', 'smith', 'male', 'abc123', 1)",
      {username: 'username' & randRange(10,99,'SHA1PRNG')},
      {datasource = "mysql"}
    );
  cfhttp(method="GET", charset="utf-8", url="https://some-random-api.ml/animal/raccoon", result="result") {
    cfhttpparam(name="q", type="url", value="cfml");
    }

</cfscript>
