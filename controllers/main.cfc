<cfcomponent >
	<cffunction name="default" output="false">
		<cfargument name="rc" >
			<cfif isDefined("rc.address") and isDefined("rc.search")>
				<cfset rc.data = application.model.cfApp.data(rc.address,rc.search)/>
				<cfif rc.search is "officials" and StructKeyExists(deserializeJSON(rc.data), "error") is not "YES">
					<cfset rc.officialsArray = application.model.cfApp.makeOfficialsStruct(rc.data)/>
				<cfelseif rc.search is "elections" and StructKeyExists(deserializeJSON(rc.data), "error") is not "YES">
					<cfset rc.electionsArray = application.model.cfApp.makeElectionsStruct(rc.data)/>
				<cfelse>
				<cfset rc.requestError = "error" />
				<cfset rc.requestErrorMessage = application.model.cfApp.getErrorMessage(rc.data)/>
				</cfif>
		</cfif>
	</cffunction>
</cfcomponent>
