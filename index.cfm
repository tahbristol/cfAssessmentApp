<cfif isDefined("form.address") and len(trim(form.address)) and isDefined("form.search")>
  <cfset  response=requestData(form.address, form.search)/>

  <cfif form.search IS "officials" and  StructKeyExists(deserializeJSON(response), "error") is not "YES">
    <cfset  officialssArray=makeOfficialsStruct(response)/>
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
                    <input class="form-control" id="addressToSearch" name="address" placeholder="Address..." value="#form.address#"/>
                  </cfoutput>
                <cfelse>
                  <cfoutput>
                    <input class="form-control" id="addressToSearch" name="address" placeholder="Address..." value=""/>
                  </cfoutput>
                </cfif>
                <cfif isDefined("form.search") and form.search IS "elections">
                  <input type="radio" name="search" value="officials">
                    Officials</input>
                  <input type="radio" name="search" value="elections" checked="checked">
                    Elections</input><br>
                <cfelse>
                  <input type="radio" name="search" value="officials" checked="checked">
                    Officials</input>
                  <input type="radio" name="search" value="elections">
                    Elections</input><br>
                </cfif>
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
                      <!-- <div class="col-sm-6"> <p> Party: #officialsArray[i].party#</p> <p> Email: #officialsArray[i].email#</p> <p> Phone: #officialsArray[i].phone#</p> <a href="#officialsArray[i].website#" target="_blank"> Website</a> </div> -->

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
                          <li>#electionsArray[3][1].address.locationName#</li>
                          <li>#electionsArray[3][1].address.line1#</li>
                          <li>#electionsArray[3][1].address.city#, #electionsArray[3][1].address.state# #electionsArray[3][1].address.zip#</li>
                          <li></li>
                          <li></li>

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
  <cfif searchType IS "officials">
    <cfhttp result="result" method="GET" charset="utf-8" url="https://www.googleapis.com/civicinfo/v2/representatives?address=#address#&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI">
  <cfelse>
    <cfhttp result="result" method="GET" charset="utf-8" url="https://www.googleapis.com/civicinfo/v2/voterinfo?address=#address#?&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI">
  </cfif>

  <cfreturn result.filecontent/>

</cffunction>

<cffunction name="makeOfficialsStruct">
  <cfargument name="officialsString" type="string">
  <cfset  officialsJSON=deserializeJSON(officialsString)/>
  <cfset  officialsInfoFields=["name" ,"party" ,"phones" ,"urls" ,"emails" ,"position" , "photoUrl"]/>
  <cfset  officialsArray=[]>

  <cfset  officials=officialsJSON.officials>
  <cfset  offices=officialsJSON.offices>
  <cfset  officeIndices=[]>

  <cfloop from="1" to="#arrayLen(offices)#" index="i">
    <cfset  official={}>
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
    <cfset  officialDone=arrayAppend(officialsArray, official)/>
  </cfloop>
  <cfreturn officialsArray>
</cffunction>

<cffunction name="makeElectionsStruct">
  <cfargument name="electionsString" type="string">

  <cfset  electionsJSON=deserializeJSON(electionsString)/>
  <cfset  elections=electionsJSON.election/>
  <cfset  userAddress=electionsJSON.normalizedInput/>
  <cfset  dropOffLocations=arraySlice(electionsJSON.dropOffLocations, 1, 3)/>

  <cfset  stateInfo=electionsJSON.state[1]/>
  <cfset  votingInfo=stateInfo.electionAdministrationBody/>

  <cfreturn [elections, votingInfo, dropOffLocations]/>
</cffunction>

<cffunction name="getErrorMessage">
  <cfargument name="errorString" type="string">
  <cfset local.errorJSON=deserializeJSON(errorString)/>
  <cfset local.message=errorJSON.error.errors[1].message/>
  <cfreturn message>
</cffunction>
