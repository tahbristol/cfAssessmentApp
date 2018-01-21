<cfcomponent output="false">
	<cffunction name="search" output="false" access="remote" returnFormat="json">
		<cfargument name="rc">
		<cfargument name="officialsString" default="" type="string">
		<cfset rc.officialsArray=application.model.cfApp.makeOfficialsStruct(officialsString)>
		<cfreturn rc>
	</cffunction>
</cfcomponent>
