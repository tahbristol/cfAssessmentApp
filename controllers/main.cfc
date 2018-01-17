<cfcomponent accessors="yes">
	<cfproperty name="dataService">
	<cffunction name="default" output="false">
		<cfargument name="rc" >
			<cfif isDefined("rc.address") and isDefined("rc.search")>
				<cfset rc.data = variables.dataService.data(rc.address,rc.search)/>
				<cfif rc.search is "officials" and StructKeyExists(deserializeJSON(rc.data), "error") is not "YES">
					<cfset rc.officialsArray = variables.dataService.makeOfficialsStruct(rc.data)/>
				<cfelseif rc.search is "elections" and StructKeyExists(deserializeJSON(rc.data), "error") is not "YES">
					<cfset rc.electionsArray = variables.dataService.makeElectionsStruct(rc.data)/>
				<cfelse>
				<cfset rc.requestError = "error" />
				<cfset rc.requestErrorMessage = variables.dataService.getErrorMessage(rc.data)/>
				</cfif>
		</cfif>
	</cffunction>
</cfcomponent>
