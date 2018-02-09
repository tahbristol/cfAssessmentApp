<cfset request.layout=false>
<cfset serviceColors = {facebook = "##3B5998",
												twitter = "##1DA1F2",
												linkedin = "##007BB5",
												pintrest = "##BD081C",
												gmail = "##DB4437",
												instagram = "##C32AA3",
												whatsapp = "##25D366",
												reddit = "##FF4500",
												tumblr = "##35465D"} />

<cfif StructCount(#rc.rangeShares#)>
	<cfoutput>
		<cfchart format="png" scalefrom="0" scaleto="8" width="800">
			<cfloop collection="#rc.rangeShares#" item="service">
				<cfset data=application.model.cfShares.graphData(rc.fromDate, rc.toDate, '#service#')/>
				<cfchartseries type="line" serieslabel="#service#" seriesColor="#serviceColors[service]#" >
					<cfloop from="1" to="#data.recordCount#" index="i">
					<cfset date = "#data["THEMONTH"][i]#/#data["THEDAY"][i]#/#data["THEYEAR"][i]#"/>
						<cfchartdata item="#date#" value="#data["COUNTs"][i]#">
					</cfloop>
				</cfchartseries>
			</cfloop>
		</cfchart><br><br>
	</cfoutput>

	<cfloop collection="#rc.rangeShares#" item="service">
		<cfoutput>
			<div class="col-sm-3" id="#service#Counts">
				<h4>#htmleditformat(service)#</h4 >
				<h3>#htmleditformat(rc.rangeShares[service])#</h3>
			</div>
		</cfoutput>
	</cfloop>
<cfelse>
	<cfoutput>
		<h4>No Current Share Data</h4>
	</cfoutput>
</cfif>


<!---ToDo
	1. Date output in order
	2. Struct sort for service countsArray
	3. Color random for services without pre-defined Color
	4. plan for days with zero data
	--->
