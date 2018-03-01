<cfset request.layout=false>
	<cfoutput>
	<table id="shareTable">
		<tbody>
			<h3>Total Shares</h3>
			<tr>
				<th>Facebook</th>
				<th>Twitter</th>
				<th>Linkedin</th>
			</tr>
			<tr>
				<cfif isDefined("rc.serviceCount")>
					<cfset fbCount = "#rc.serviceCount.facebook["computed_column_1"]#" /> <!--- not really sure about how to access this query data --->
					<cfset twCount = "#rc.serviceCount.twitter["computed_column_1"]#" />
					<cfset lkCount = "#rc.serviceCount.linkedin["computed_column_1"]#" />
					<td>#fbCount#</td>
					<td>#twCount#</td>
					<td>#lkCount#</td>
				</cfif>
			</tr>
		</tbody>
	</table>
</cfoutput>
