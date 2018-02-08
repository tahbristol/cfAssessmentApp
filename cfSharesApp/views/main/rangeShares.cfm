<cfset request.layout=false>

	<cfif StructCount(#rc.rangeShares#)>

		<cfoutput>
			<cfchart
		 format="png"
		 scalefrom="0"
		 scaleto="20">
		<cfchartseries
				type="bar"
				serieslabel="Shares"
				seriescolor="##1DA1F2">
				<cfloop collection="#rc.rangeShares#" item="service">
			<cfchartdata item="#service#" value="#rc.rangeShares[service]#">
			</cfloop>
		</cfchartseries>
	</cfchart><br><br>


		</cfoutput>


		<cfloop collection="#rc.rangeShares#" item="service">

			<cfoutput>
				<div class="col-sm-3" id="#service#Counts">
					<h4>#htmleditformat(service)#</h4	>
					<h3>#htmleditformat(rc.rangeShares[service])#</h3>
				</div>
			</cfoutput>
		</cfloop>

	<cfelse>

		<cfoutput>
			<h4>No Current Share Data</h4>
		</cfoutput>

	</cfif>
