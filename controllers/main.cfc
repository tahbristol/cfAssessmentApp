<cfcomponent >

	<cffunction name="init" output="false" hint="Constructor, passed in the FW/1 instance.">
		<cfargument name="fw"/>
		<cfset variables.fw=arguments.fw/>
		<cfreturn this/>
	</cffunction>

	<cffunction name="default" output="false" access="remote" returnformat='json'>
		<cfargument name="rc">
		<!---if i copy past the search function content into here the api request works and the data is returned as it should. However on
			putting the function below it returns an error--->
	</cffunction>

	<cffunction name="search" output="false"  >
		<cfargument name="rc">
		<cfif isDefined("rc.address") and isDefined("rc.search")>
			<cfset rc.data=application.model.cfApp.data(rc.address,rc.search)/>
			<cfif search is "officials" and StructKeyExists(deserializeJSON(rc.data), "error") is not "YES">
				<cfset rc.officialsArray=application.model.cfApp.makeOfficialsStruct(rc.data)/>
			<cfelseif search is "elections" and StructKeyExists(deserializeJSON(rc.data), "error") is not "YES">
				<cfset rc.electionsArray=application.model.cfApp.makeElectionsStruct(rc.data)/>
			<cfelse>
				<cfset rc.requestError="error"/>
				<cfset rc.requestErrorMessage=application.model.cfApp.getErrorMessage(rc.data)/>
			</cfif>
		</cfif>
	</cffunction>

</cfcomponent>
