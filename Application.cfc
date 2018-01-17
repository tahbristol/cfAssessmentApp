<cfcomponent extends="framework.one">
	<cffunction name="setupApplication">
		<cfset application.model={}/>
		<cfset application.model.cfApp=createObject("component","model.cfApp").init( dsn = "cfAssessmentAppF1" )/>
	</cffunction>
</cfcomponent>
