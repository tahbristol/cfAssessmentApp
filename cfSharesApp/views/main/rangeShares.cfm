<cfset request.layout=false>

	<cfif StructCount(#rc.rangeShares#)>

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
