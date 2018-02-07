<cfcomponent accessors="true">

	<cffunction name="init">
		<cfargument name="dsn" required="true"/>
		<cfset variables.instance.dsn=arguments.dsn/>
		<cfreturn this/>
	</cffunction>


<cffunction name="recordShares">
	<cfargument name="sharesData">
		<cfset local.sharesData = deserializeJSON(sharesData)/>
		<cfquery datasource="TestShareData">
			INSERT INTO dbo.shares (SiteID, LettergroupID, ServiceName, ShareTime, FrameParent)
			VALUES (
				<cfqueryparam value="#sharesData.siteId#"/>, <cfqueryparam value="#sharesData.lettergroupId#"/>,
				<cfqueryparam value="#sharesData.service#"/>, <cfqueryparam value="#sharesData.time#"/>,
				<cfqueryparam value="#sharesData.frameParent#"/>
			)
		</cfquery>
	</cffunction>

	<cffunction name="getDayShares">
		<cfset local.services = ['facebook', 'twitter', 'linkedin'] />
		<cfset local.totalCounts = {} />
		<cfloop from="1" to="#arrayLen(services)#" index="i" >
			<cfquery datasource="TestShareData" name="local.shareCount">
				SELECT COUNT(*) FROM dbo.shares WHERE ServiceName=  <cfqueryparam value="#services[i]#"/>
			</cfquery>
			<cfset totalCounts["#services[i]#"] = shareCount />
		</cfloop>
		<cfreturn totalCounts />
	</cffunction>

	<cffunction name="getRangeShares">
		<cfargument name="fromDate">
		<cfargument name="toDate">
			<cfset local.services = ['facebook', 'twitter', 'linkedin'] />
			<cfset local.totalCounts = {} />
			<cfset rc.results = [] />
			<!---<cfloop from="1" to="#arrayLen(services)#" index="i" >--->
				<cfquery datasource="TestShareData" name="local.rangeShareCount">
					SELECT COUNT(*) AS 'Total Shares',
						ServiceName
					FROM dbo.shares
					WHERE ShareTime
					BETWEEN <cfqueryparam value="#fromDate#"/>
					AND <cfqueryparam value="#toDate#"/>
					<!---AND ServiceName = <cfqueryparam value="#services[i]#"/>--->
					GROUP BY ServiceName       <!--- Need to work on this query, not quite what I want --->
				</cfquery>
				<cfset ArrayAppend(rc.results, rangeShareCount) />
			<!---</cfloop>--->
		<cfreturn rc.results />
	</cffunction>

</cfcomponent>
