<cfcomponent >

	<cffunction name="init" output="false" hint="Constructor, passed in the FW/1 instance.">
		<cfargument name="fw"/>
		<cfset variables.fw=arguments.fw/>
		<cfreturn this/>
	</cffunction>

	<cffunction name="default" output="false">
		<cfargument name="rc">
	</cffunction>

	<cffunction name="search" output="false">
		<cfargument name="rc">
		<cfif isDefined("rc.address") and isDefined("rc.search")>
			<cfset application.model.cfApp.saveUserAddress(rc.address)/>
			<cfset rc.data=application.model.cfApp.data(rc.address,rc.search)/>
			<cfif rc.search is "officials" and StructKeyExists(deserializeJSON(rc.data), "error") is not "YES">
				<cfset rc.officialsArray=application.model.cfApp.makeOfficials(rc.data)/>
			<cfelseif rc.search is "elections" and StructKeyExists(deserializeJSON(rc.data), "error") is not "YES">
				<cfset rc.electionsArray=application.model.cfApp.makeElections(rc.data)/>
			<cfelse>
				<cfset rc.requestError="error"/>
				<cfset rc.requestErrorMessage=application.model.cfApp.getErrorMessage(rc.data)/>
			</cfif>
		</cfif>
	</cffunction>

	<cffunction name="clearSession">
		<cfargument name="rc">
			<cfset StructDelete(session, "cfappUserAddress")>
				<cfset StructDelete(session, "cfAppUserCookie")/>
				<cfset StructDelete(cookie, "cfApp")/>
			<cfreturn >
	</cffunction>

</cfcomponent>
