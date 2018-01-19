<cfcomponent >
	<cffunction name="default" output="false" access="remote" returnFormat="plain">
		<cfargument name="rc">
		<cfargument name="officialsString" default="">

			<cfset rc.officialsArray = application.model.cfApp.makeOfficialsStruct(officialsString)>
				<cfreturn rc>
	</cffunction>
</cfcomponent>
