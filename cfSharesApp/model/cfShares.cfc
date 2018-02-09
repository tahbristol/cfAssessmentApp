<cfcomponent accessors="true">

	<cffunction name="init">
		<cfargument name="dsn" required="true"/>
		<cfset variables.instance.dsn=arguments.dsn/>
		<cfreturn this/>
	</cffunction>

	<cffunction name="recordShares">
		<cfargument name="sharesData">
		<cfset local.sharesData = deserializeJSON(sharesData)/	>
		<cfquery datasource="TestShareData"	>
			INSERT INTO dbo.shares
				(SiteID, LettergroupID, ServiceName, ShareTime, FrameParent)
			VALUES (
				<cfqueryparam value="#sharesData.siteId#"/>, <cfqueryparam value="#sharesData.lettergroupId	#"/>,
				<cfqueryparam value="#sharesData.service#"/>, <cfqueryparam value="#sharesData.time#"/>,
				<cfqueryparam value="#sharesData.frameParent#"	/>
				)
		<	/cfquery>
	</cffunction>

	<cffunction name="getRangeShares">
		<cfargument name="fromDate">
		<cfargument name="toDate">
		<cfargument name="siteId">
		<cfargument name="lettergroupId">
		<cfset local.counts = {} />
		<cfset local.countsArray = [] />

		<cfquery datasource="TestShareData" name="local.rangeShareCount">
			SELECT
				TOP 4 COUNT(*) AS 'Total Shares'
				, ServiceName
			FROM dbo.shares
			WHERE ShareTime
				BETWEEN <cfqueryparam value="#fromDate#"/>
					AND <cfqueryparam value="#toDate#"/><!---supposed to be inclusive?--->
			GROUP BY ServiceName
			ORDER BY count(*) DESC
		</cfquery>

		<cfset local.counts = {} />
		<cfloop from="1" to="#rangeShareCount.recordcount#" index="i">
			<cfset  counts["#rangeShareCount["SERVICENAME"][i]#"] = "#rangeShareCount["TOTAL SHARES"][i]#"/>
		</cfloop>

		<cfreturn counts />
	</cffunction>

	<cffunction name="graphData">
		<cfargument name="fromDate">
		<cfargument name="toDate">
		<cfargument name="service">
			<cfargument name="siteId" default="">
			<cfargument name="lettergroupId" default="">

		<cfquery datasource="TestShareData" name="local.graphCounts">
			SELECT
				count(*) AS Counts
				, DAY(ShareTime) AS theday
				, MONTH(ShareTime) AS themonth
				, YEAR(ShareTime) AS theyear
			FROM dbo.shares
			WHERE ServiceName = <cfqueryparam value="#service#">
				AND ShareTime BETWEEN <cfqueryparam value="#fromDate#"/>
					AND <cfqueryparam value="#toDate#"/>
			GROUP BY
				YEAR(ShareTime)
				, MONTH(ShareTime)
				, DAY(ShareTime)
			ORDER BY
				MONTH(ShareTime)
				, DAY(ShareTime)
				, YEAR(ShareTime)
			</cfquery>

		<cfreturn graphCounts>
	</cffunction>

</cfcomponent>
