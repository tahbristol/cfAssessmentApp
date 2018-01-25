<cfcomponent extends="framework.one">


		<cfset this.sessionManagement="yes"/>
		<cfset this.sessionTimeOut="#CreateTimeSpan(0,0,30,0)#"/>


	<cffunction name="setupApplication">
		<cfset application.model={}/>
		<cfset application.model.cfApp=createObject("component","model.cfApp").init( dsn = "cfAssessmentApp" )/>
	</cffunction>

	<cffunction name="setupSession">

		<cfset application.model.cfApp.saveOrIssueCookie("cfApp") />
	
	</cffunction>

</cfcomponent>
