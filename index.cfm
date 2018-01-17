<cfif isDefined("form.address") and len(trim(form.address)) and isDefined("form.search")>
	<cfset  response=requestData(form.address, form.search)/>
	<cfif form.search is "officials" and  StructKeyExists(deserializeJSON(response), "error") is not "YES">
		<cfset  officialsArray=makeOfficialsStruct(response)/>
	<cfelseif form.search is "elections" and StructKeyExists(deserializeJSON(response), "error") is not "YES">
		<cfset  electionsArray=makeElectionsStruct(response)/>
	<cfelse>
		<cfset requestError="error" />
		<cfset requestErrorMessage=getErrorMessage(response)/>
	</cfif>
</cfif>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Civically Engaged</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="./stylesheets/style.css">
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
		<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
	</head>
	<body>

		<div class="site-wrapper">
			<div class="site-wrapper-inner">
				<div class="cover-container">
					<header class="masthead clearfix">
						<div class="inner">
							<h3 class="masthead-brand">Civically Engaged</h3>
							<nav class="nav nav-masthead">
								<a class="nav-link active" href="">Start Over</a>
							</nav>
						</div>
					</header>
					<div class="clearfix"></div>

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
										<input type="radio" name="search" value="officials"
												<cfif isDefined("form.search") and form.search is "officials">
													checked="checked"
												</cfif> />
											Officials
									</label>
									<label>
										<input type="radio" name="search" value="elections"
												<cfif isDefined("form.search") and form.search is "elections">
													checked="checked"
												</cfif> />
											Elections
									</label>
									<br/>
								<small class="form-text text-muted">Enter an address to find your representatives.</small><br>
								<small class="form-text text-muted">We will not save your address, Promise!</small>
							</div>
							<button class="btn btn-primary" type="submit" value="address">Search</button>
						</form>
						<cfif isDefined("officialsArray") and isArray(officialsArray)>
							<cfloop from="1" to="#arrayLen(officialsArray)#" index="i">
								<cfoutput>
									<div id="body" class="container card">
										<div class="row">
											<div class="col-sm-12">
												<div class="thumbnail">
													<cfif officialsArray[i].photo is not "">
													<img src="#officialsArray[i].photo#" alt="photo of #officialsArray[i].name#"/>
												</cfif>
													<div class="caption">
														<h3>
															#officialsArray[i].name#</h3>
														<p>
															#officialsArray[i].position#</p>
														<p>
															Party: #officialsArray[i].party#</p>
														<p>
															Email: #officialsArray[i].email#</p>
														<p>
															Phone: #officialsArray[i].phone#</p>
														<a href="#officialsArray[i].website#" target="_blank">
															Website</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</cfoutput>
							</cfloop>
							<cfelseif isDefined("electionsArray") and isArray(electionsArray)>
								<cfoutput>


									<div id="body" class="container card">
										<div class="row">
											<div class="col-sm-4">
												<h3>Election</h3>
												<h5>#electionsArray[1].name#</h5>
												<h5>Date: #electionsArray[1].electionDay#</h5>
											</div>
											<div class="col-sm-4">
												<ul>
													<h3>Voting Help</h3>
													<li>
														<a href="#electionsArray[2].ballotInfoUrl#">Ballot Info</a>
													</li>
													<li>
														<a href="#electionsArray[2].electionRegistrationUrl#">Register</a>
													</li>
													<li>
														<a href="#electionsArray[2].electionRulesUrl#">Voting Rules</a>
													</li>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul>
													<h3>Ballot Drop Off Locations</h3>
													<button class="btn btn-primary" id="dropOffsBtn" type="button" data-toggle="collapse" data-target="##dropOffLocations">Expand</button>
													<div class="collapse" id="dropOffLocations">
														<cfloop from="1" to="#arrayLen(electionsArray[3])#" index="i">
														<li>#electionsArray[3][i].address.line1#</li>
														<li>#electionsArray[3][i].address.locationName#</li>
														<li>#electionsArray[3][i].address.city#, #electionsArray[3][i].address.state# #electionsArray[3][i].address.zip#</li>
														<li></li>
														<li></li>
														<hr id="dropOffsRule"/>
													</cfloop>
													</div>
												</ul>
											</div>
										</div>
									</div>

								</cfoutput>
								<cfelseif isDefined("requestError")>
									<cfoutput>
									<cfswitch expression="#requestErrorMessage#">
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
					</main>
				</div>
			</div>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>

<cffunction name="requestData" returnType="string">
	<cfargument name="address" type="string">
	<cfargument name="searchType" type="string">
	<cfif searchType is "officials">
		<cfhttp result="result" method="GET" charset="utf-8" url="https://www.googleapis.com/civicinfo/v2/representatives?address=#address#&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI">
	<cfelse>
		<cfhttp result="result" method="GET" charset="utf-8" url="https://www.googleapis.com/civicinfo/v2/voterinfo?address=#address#?&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI">
	</cfif>
	<cfreturn result.filecontent/>
</cffunction>

<cffunction name="makeOfficialsStruct">
	<cfargument name="officialsString" type="string">
	<cfset  local.officialsJSON=deserializeJSON(officialsString)/>
	<cfset  local.officialsInfoFields=["name" ,"party" ,"phones" ,"urls" ,"emails" ,"position" , "photoUrl"]/> <!--can remove?-->
	<cfset  local.officialsArray=[]>
	<cfset  local.officials=officialsJSON.officials/>
	<cfset  local.offices=officialsJSON.offices/>
	<cfset  local.officeIndices=[]/>

	<cfloop from="1" to="#arrayLen(offices)#" index="i">
		<cfset  local.official={}>
		<cfloop from="1" to="#arrayLen(offices[i].officialIndices)#" index="j">
			<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "emails")>
				<cfset  official["email"]=officials[offices[i].officialIndices[j] + 1].emails[1]/>
			<cfelse>
				<cfset  official["email"]="Unknown"/>
			</cfif>
			<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "urls")>
				<cfset  official["website"]=officials[offices[i].officialIndices[j] + 1].urls[1]/>
			<cfelse>
				<cfset  official["website"]="Unknown"/>
			</cfif>
			<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "phones")>
				<cfset  official["phone"]=officials[offices[i].officialIndices[j] + 1].phones[1]/>
			<cfelse>
				<cfset  official["phone"]="Unknown"/>
			</cfif>
			<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "photoUrl")>
				<cfset  official["photo"]=officials[offices[i].officialIndices[j] + 1].photoUrl/>
			<cfelse>
				<cfset  official["photo"]=""/>
			</cfif>
			<cfset  official["name"]=officials[offices[i].officialIndices[j] + 1].name/>
			<cfset  official["party"]=officials[offices[i].officialIndices[j] + 1].party/>
			<cfset  official["position"]=offices[i].name/>
		</cfloop>
		<cfset  local.officialDone=arrayAppend(local.officialsArray, official)/>
	</cfloop>
	<cfreturn local.officialsArray>
</cffunction>

<cffunction name="makeElectionsStruct">
	<cfargument name="electionsString" type="string">
	<cfset  local.electionsJSON=deserializeJSON(electionsString)/>
	<cfset  local.elections=electionsJSON.election/>
	<cfset  local.userAddress=electionsJSON.normalizedInput/>
	<cfset  local.dropOffLocations=arraySlice(electionsJSON.dropOffLocations, 1, 3)/>
	<cfset  local.stateInfo=electionsJSON.state[1]/>
	<cfset  local.votingInfo=stateInfo.electionAdministrationBody/>
	<cfreturn [elections, votingInfo, dropOffLocations]/>
</cffunction>

<cffunction name="getErrorMessage">
	<cfargument name="errorString" type="string">
	<cfset local.errorJSON=deserializeJSON(errorString)/>
	<cfset local.message=errorJSON.error.errors[1].message/>
	<cfreturn message>
</cffunction>
