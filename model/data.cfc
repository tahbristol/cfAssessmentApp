<cfcomponent>
	<cffunction name="init">
		<cfargument name="dsn" required="true" />
		<cfset variables.instance.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="requestData" returnType="string">
		<cfargument name="address" type="string">
		<cfargument name="searchType" type="string">
		<cfif searchType is "officials">
			<cfhttp result="result" method="GET" charset="utf-8" url="https://www.googleapis.com/civicinfo/v2/representatives?address=#address#&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI">
		<cfelse>
			<cfhttp result="result" method="GET" charset="utf-8" url="https://www.googleapis.com/civicinfo/v2/voterinfo?address=#address#?&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI">
		</cfif>
		<cfreturn result.filecontent/>
	</cffunction>

</cfcomponent>
