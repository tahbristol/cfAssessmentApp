<cfcomponent extends="framework.one">


		<cfset this.sessionManagement="yes"/>
		<cfset this.sessionTimeOut="#CreateTimeSpan(0,0,30,0)#"/>


	<cffunction name="setupApplication">
		<cfset application.model={}/>
		<cfset application.model.cfShares=createObject("component","model.cfShares").init( dsn = "cfSharesApp" )/>
		
	</cffunction>

	<cffunction name="setupSession">
		<!---<cfset application.model.cfShares.saveOrIssueCookie("cfShares") />--->
	</cffunction>

</cfcomponent>
