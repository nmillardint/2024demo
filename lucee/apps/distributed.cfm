<cfhttp url="http://go-app:3000/fetch/1" result="result">
    	<cfhttpparam type="url" name="p" value="about">
</cfhttp>

<cfhttp url="http://go-app:3000/fetch/2" result="result">
    <cfhttpparam type="url" name="p" value="about">
</cfhttp>

<cfhttp url="http://go-app:3000/fetch/3" result="result">
    <cfhttpparam type="url" name="p" value="about">
</cfhttp>

<cfhttp url="http://go-app:3000/fetch/4" result="result">
    <cfhttpparam type="url" name="p" value="about">
</cfhttp>

<cfhttp url="http://go-app:3000/error" result="result">
    <cfhttpparam type="url" name="p" value="about">
</cfhttp>
