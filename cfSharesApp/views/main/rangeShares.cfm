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
		<cfchart format="png"
			scalefrom="0"

			width="900"
			show3d="no"
			tipStyle="none"
			showMarkers="no"
			foregroundcolor="gray"
			seriesplacement="cluster"
			>

			<cfloop collection="#rc.rangeShares#" item="service">
				<cfset data=application.model.cfShares.graphData(rc.fromDate, rc.toDate, '#service#')/>

				<cfchartseries type="line" serieslabel="#service#" seriesColor="#serviceColors[service]#" >
					<cfloop from="#rc.fromDate#" to="#rc.toDate#" index="date">
						<cfif structKeyExists(data, dateformat(date, "m/d/yyyy")) >
							<cfchartdata item = "#dateformat(date, "m/d/yyyy")#" value = "#data[dateformat(date, "m/d/yyyy")]#">
						<cfelse>
							<cfchartdata item="#dateformat(date, "m/d/yyyy")#" value="0" >
						</cfif>
					</cfloop>
				</cfchartseries>

			</cfloop>

		</cfchart><br><br>
	</cfoutput>

	<cfset serviceArray = structSort(rc.rangeShares, 'numeric', 'desc') />

	<cfloop from="1" to="#arraylen(serviceArray)#" index="i">
		<cfoutput>
			<div class="col-sm-3" id="#serviceArray[i]#Counts">
				<h4>#htmleditformat(serviceArray[i])#</h4 >
				<h3>#htmleditformat(rc.rangeShares[serviceArray[i]])#</h3>
			</div>
		</cfoutput>
	</cfloop>

<cfelse>

	<cfoutput>
		<h4>No New Share Data</h4>
	</cfoutput>

</cfif>


<!---ToDo
	1. Date output in order---------------------DONE
	2. Struct sort for service countsArray
	3. Color random for services without pre-defined Color
	4. plan for days with zero data--------------DONE
	--->
