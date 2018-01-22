<cfcomponent output="false">

	<cffunction name="init" output="false" hint="Constructor, passed in the FW/1 instance.">
		<cfargument name="fw" />
		<cfset variables.fw = arguments.fw />
		<cfreturn this />
	</cffunction>

	<cffunction name="searchOfficials" output="false" access="remote" returnformat="json" >
		<cfargument name="rc">
		<cfargument name="officialsString" default="" type="string">
		<cfset rc.officialsArray=application.model.cfApp.makeOfficialsStruct(officialsString)>
			
			<cfreturn >
	</cffunction>


	<cffunction name="searchElections" output="false" access="remote" returnformat="json">
		<cfargument name="rc">
		<cfargument name="electionsString" default="" type="string">
		<cfset rc.electionsArray=application.model.cfApp.makeElectionsStruct(electionsString)>
		<cfreturn rc>
	</cffunction>
</cfcomponent>
