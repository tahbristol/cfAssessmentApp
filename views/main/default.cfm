<cfoutput>
	<main class="jumbotron">
		<h4>Ready to get involved? Find your Elected Officials or Election info here!</h4>
		<form id="representatives" method="post" action="">
			<div id="addressInput" class="form-group">
				<label for="address">Address</label>
				<cfif isDefined("form.address")>
					<cfoutput>
						<input class="form-control" id="addressToSearch" name="address" placeholder="At least a zipcode for officials. Elections need a full address." value="#form.address#"/>
					</cfoutput>
				<cfelse>
					<cfoutput>
						<input class="form-control" id="addressToSearch" name="address" placeholder="At least a zipcode for officials. Elections need a full address." value=""/>
					</cfoutput>
				</cfif>
				<label>
					<input id="searchType" type="radio" name="search" value="officials" <cfif isDefined("form.search") and rc.search is "officials">
									checked="checked"
								</cfif>/>
					Officials
				</label>
				<label>
					<input id="searchType" type="radio" name="search" value="elections" <cfif isDefined("form.search") and rc.search is "elections">
									checked="checked"
								</cfif>/>
					Elections
				</label>
				<br/>
				<small class="form-text text-muted">Enter an address to find your representatives.</small><br>
				<small class="form-text text-muted">We will not save your address, Promise!</small>
			</div>
			<button class="btn btn-primary" type="submit" value="address">Search</button>
		</form>
		<cfif isDefined("rc.officialsArray") and isArray(rc.officialsArray)>
			<cfloop from="1" to="#arrayLen(rc.officialsArray)#" index="i">
				<cfoutput>
					<div id="body" class="container card">
						<div class="row">
							<div class="col-sm-12">
								<div class="thumbnail">
									<cfif rc.officialsArray[i].photo is not "">
										<img src="#htmleditformat(rc.officialsArray[i].photo)#" alt="photo of #htmleditformat(rc.officialsArray[i].name)#"/>
									</cfif>
									<div class="caption">
										<h3>
											#htmleditformat(rc.officialsArray[i].name)#</h3>
										<p>
											#htmleditformat(rc.officialsArray[i].position)#</p>
										<p>
											Party: #htmleditformat(rc.officialsArray[i].party)#</p>
										<p>
											Email: #htmleditformat(rc.officialsArray[i].email)#</p>
										<p>
											Phone: #htmleditformat(rc.officialsArray[i].phone)#</p>
										<cfif rc.officialsArray[i].website is "Unknown">
											<p>Website: Unknown</p>
										<cfelse>
											<a href="#htmleditformat(rc.officialsArray[i].website)#" target="_blank">
											Website</a>
										</cfif>
									</div>
								</div>
							</div>
						</div>
					</div>
				</cfoutput>
			</cfloop>
		<cfelseif isDefined("rc.electionsArray") and isArray(rc.electionsArray)>
			<cfoutput>
				<div id="body" class="container card">
					<div class="row">
						<div class="col-sm-4">
							<h3>Election</h3>
							<h5>#htmleditformat(rc.electionsArray[1].name)#</h5>
							<h5>Date: #htmleditformat(rc.electionsArray[1].electionDay)#</h5>
						</div>
						<div class="col-sm-4">
							<ul>
								<h3>Voting Help</h3>
								<li>
									<a href="#htmleditformat(rc.electionsArray[2].ballotInfoUrl)#">Ballot Info</a>
								</li>
								<li>
									<a href="#htmleditformat(rc.electionsArray[2].electionRegistrationUrl)#">Register</a>
								</li>
								<li>
									<a href="#htmleditformat(rc.electionsArray[2].electionRulesUrl)#">Voting Rules</a>
								</li>
							</ul>
						</div>
						<div class="col-sm-4">
							<ul>
								<h3>Ballot Drop Off Locations</h3>
								<button class="btn btn-primary" id="dropOffsBtn" type="button" data-toggle="collapse" data-target="##dropOffLocations">Expand</button>
								<div class="collapse" id="dropOffLocations">
									<cfloop from="1" to="#arrayLen(rc.electionsArray[3])#" index="i">
										<li>#htmleditformat(rc.electionsArray[3][i].address.line1)#</li>
										<li>#htmleditformat(rc.electionsArray[3][i].address.locationName)#</li>
										<li>#htmleditformat(rc.electionsArray[3][i].address.city)#, #htmleditformat(rc.electionsArray[3][i].address.state)# #htmleditformat(rc.electionsArray[3][i].address.zip)#</li>
										<hr id="dropOffsRule"/>
									</cfloop>
								</div>
							</ul>
						</div>
					</div>
				</div>
			</cfoutput>
		<cfelseif isDefined("rc.requestError")>
			<cfoutput>
				<cfswitch expression="#rc.requestErrorMessage#">
					<cfcase value="Election unknown">
						<div id="searchError">It looks like there are no upcomming elections for your address. Check back at a later date.</div>
					</cfcase>
					<cfcase value="Failed to parse address">
						<div id="searchError">There seems to be a problem with the address you entered. Please use a full address with street, city, state and zip.</div>
					</cfcase>
					<cfdefaultcase>
						<div id="searchError">There was a problem with the search request. Please try again later.</div>
					</cfdefaultcase>
				</cfswitch>
			</cfoutput>
		</cfif>
	</cfoutput>
