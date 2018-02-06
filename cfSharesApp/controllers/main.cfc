<cfcomponent >

	<cffunction name="init" output="false" hint="Constructor, passed in the FW/1 instance.">
		<cfargument name="fw"/>
		<cfset variables.fw=arguments.fw/>
		<cfreturn this/>
	</cffunction>

	<cffunction name="default" output="false">
		<cfargument name="rc">
	</cffunction>

	<cffunction name="updateShares" output="false">
		<cfargument name="rc">
		<cfset application.model.cfShares.recordShares(rc.shareData)/>
		<cfreturn />
	</cffunction>

	<cffunction name="totalShares" output="false">
		<cfargument name="rc">
		<cfset rc.serviceCount = application.model.cfShares.getTotalShares()/>
	</cffunction>

 	<cffunction name="countsPerWeek">
		<cfargument name="rc">
	</cffunction>

	<cffunction name="countsPerDay">
		<cfargument name="rc">
	</cffunction>

</cfcomponent>
