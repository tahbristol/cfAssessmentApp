
<cfif isDefined("form.address") and len(trim(form.address))>
  <cfset response = requestData(form.address) />
  <cfset test = makeOfficialsStruct(response) />
  <cfdump var="#isArray(test)#"/>
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
    <h1 id="site">Civically Engaged</h1>
    <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">
          <header class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand"></h3>
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
                    <input class="form-control" id="addressToSearch" name="address" placeholder="Address..." value=""/>
                  <cfelse>
                    <input class="form-control" id="addressToSearch" name="address" placeholder="Address..." value=""/>
                  </cfif>
                  <input type="radio" name="search" value="officials" > Officials</input>
                  <input type="radio" name="search" value="elections" > Elections</input><br>
                  <small class="form-text text-muted">Enter an address to find your representatives.</small><br>
                  <small class="form-text text-muted">We will not save your address, Promise!</small>
                </div>
                <button class="btn btn-primary" type="submit" value="address">Search</button>
              </form>
          </main>
        </div>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  </body>
</html>

<cffunction name = "requestData" returnType = "string">
    <cfargument name= "address" type="string">
    <cfhttp result="result" method="GET" charset="utf-8" url="https://www.googleapis.com/civicinfo/v2/representatives?address=#address#&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI">
      <cfreturn result.filecontent />
</cffunction>

<cffunction name = "makeOfficialsStruct" >
   <cfargument name="officialsString" type="string">
   <cfset officialsJSON = deserializeJSON(officialsString) />
   <cfset officialsInfoFields = ["name","party","phones","urls","emails","position"] />
   <cfset officialsArray = [] >

   <cfset officials = officialsJSON.officials >
   <cfset offices = officialsJSON.offices >
   <cfset officeIndices = [] >

   <cfloop from="1" to="#arrayLen(offices)#" index="i">
     <cfset official = {}>
     <cfloop from="1" to="#arrayLen(offices[i].officialIndices)#" index="j">
            <cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "emails") >
              <cfset official["email"] = officials[offices[i].officialIndices[j] + 1].emails[1] />
           <cfelse>
             <cfset official["email"] = "Unknown" />
           </cfif>
            <cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "urls")>
              <cfset official["website"] = officials[offices[i].officialIndices[j] + 1].urls[1] />
            <cfelse>
              <cfset official["website"] = "Unknown" />
            </cfif>
              <cfset official["name"] = officials[offices[i].officialIndices[j] + 1].name />
              <cfset official["party"] = officials[offices[i].officialIndices[j] + 1].party />
               <cfset official["phone"] = officials[offices[i].officialIndices[j] + 1].phones[1] />
              <cfset official["position"] = offices[i].name />
     </cfloop>
     <cfset officialDone = arrayAppend(officialsArray, official) />
   </cfloop>
   <cfreturn officialsArray>
</cffunction>
