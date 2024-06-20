<cfhttp url="http://lucee:8888/queryDB.cfm" result="result">
    	<cfhttpparam type="url" name="p" value="about">
</cfhttp>

<cfhttp url="http://go-app:3000/fetch/VerifyUser" result="result">
    <cfhttpparam type="url" name="p" value="about">
</cfhttp>

<cfhttp url="http://go-app:3000/fetch/PurchasePending" result="result">
    <cfhttpparam type="url" name="p" value="about">
</cfhttp>

<cfhttp url="http://storefront:8080" result="result">
    <cfhttpparam type="url" name="p" value="about">
</cfhttp>
