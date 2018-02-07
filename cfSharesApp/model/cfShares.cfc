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


	<cffunction name="getRangeShares">
		<cfargument name="fromDate">
		<cfargument name="toDate">
			<cfset local.totalCounts = {} />
			<cfset rc.results = [] />
				<cfquery datasource="TestShareData" name="local.rangeShareCount">
					SELECT COUNT(*) AS 'Total Shares',
						ServiceName
					FROM dbo.shares
					WHERE ShareTime
					BETWEEN <cfqueryparam value="#fromDate#"/>
					AND <cfqueryparam value="#toDate#"/>
					GROUP BY ServiceName
				</cfquery>
				<cfset ArrayAppend(rc.results, rangeShareCount) />
		<cfreturn rc.results />
	</cffunction>

</cfcomponent>
