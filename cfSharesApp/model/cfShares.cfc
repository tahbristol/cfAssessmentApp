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
			INSERT INTO dbo.shares (SiteID, LettergroupID, ServiceName, ShareTime, FrameParent)
			VALUES (
				<cfqueryparam value="#sharesData.siteId#"/>, <cfqueryparam value="#sharesData.lettergroupId	#"/>,
				<cfqueryparam value="#sharesData.service#"/>, <cfqueryparam value="#sharesData.time#	"/>,
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
			SELECT TOP 4 COUNT(*) AS 'Total Shares', ServiceName
			FROM dbo.shares
			WHERE ShareTime
			BETWEEN <cfqueryparam value="#fromDate#"/>
			AND <cfqueryparam value="#toDate#"/><!---supposed to be inclusive?--->
			GROUP BY ServiceName
			ORDER BY count(*) DESC
		</cfquery>

		<cfloop from="1" to="#rangeShareCount.recordcount#" index="i">
			<cfset  counts["#rangeShareCount["SERVICENAME"][i]#"] = "#rangeShareCount["TOTAL SHARES"][i]#"/>
		</cfloop>

		<cfreturn counts />
	</cffunction>

</cfcomponent>
