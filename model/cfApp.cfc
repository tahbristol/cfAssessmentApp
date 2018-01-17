<cfcomponent accessors="true">

	<cffunction name="init">
		<cfargument name="dsn" required="true"/>
		<cfset variables.instance.dsn=arguments.dsn/>
		<cfreturn this/>
	</cffunction>

	<cffunction name="data">
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
		<cfset local.officialsJSON=deserializeJSON(officialsString)/>
		<cfset local.officialsInfoFields=["name" ,"party" ,"phones" ,"urls" ,"emails" ,"position" , "photoUrl" ]/>
		<!--can remove?-->
		<cfset local.officialsArray=[]>
		<cfset local.officials=officialsJSON.officials/>
		<cfset local.offices=officialsJSON.offices/>
		<cfset local.officeIndices=[]/>

		<cfloop from="1" to="#arrayLen(offices)#" index="i">
			<cfset local.official={}>
			<cfloop from="1" to="#arrayLen(offices[i].officialIndices)#" index="j">
				<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "emails")>
					<cfset official["email" ]=officials[offices[i].officialIndices[j] + 1].emails[1]/>
				<cfelse>
					<cfset official["email" ]="Unknown"/>
				</cfif>
				
				<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "urls")>
					<cfset official["website" ]=officials[offices[i].officialIndices[j] + 1].urls[1]/>
				<cfelse>
					<cfset official["website" ]="Unknown"/>
				</cfif>

				<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "phones")>
					<cfset official["phone" ]=officials[offices[i].officialIndices[j] + 1].phones[1]/>
				<cfelse>
					<cfset official["phone" ]="Unknown"/>
				</cfif>

				<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "photoUrl")>
					<cfset official["photo" ]=officials[offices[i].officialIndices[j] + 1].photoUrl/>
				<cfelse>
					<cfset official["photo" ]=""/>
				</cfif>

				<cfset official["name" ]=officials[offices[i].officialIndices[j] + 1].name/>

				<cfif StructKeyExists(officials[offices[i].officialIndices[j]+1], "party")>
					<cfset official["party" ]=officials[offices[i].officialIndices[j] + 1].party/>
				<cfelse>
					<cfset official["party" ]="Unknown"/>
				</cfif>

				<cfif StructKeyExists(offices[i], "position")>
					<cfset official["position" ]=offices[i].name/>
				<cfelse>
					<cfset official["position" ]="Unknown"/>
				</cfif>

			</cfloop>
			<cfset local.officialDone=arrayAppend(local.officialsArray, official)/>
		</cfloop>
		<cfreturn local.officialsArray>
	</cffunction>

	<cffunction name="makeElectionsStruct">
		<cfargument name="electionsString" type="string">
		<cfset local.electionsJSON=deserializeJSON(electionsString)/>
		<cfset local.elections=electionsJSON.election/>
		<cfset local.userAddress=electionsJSON.normalizedInput/>
		<cfset local.dropOffLocations=arraySlice(electionsJSON.dropOffLocations, 1, 3)/>
		<cfset local.stateInfo=electionsJSON.state[1]/>
		<cfset local.votingInfo=stateInfo.electionAdministrationBody/>
		<cfreturn [elections, votingInfo, dropOffLocations]/>
	</cffunction>

	<cffunction name="getErrorMessage">
		<cfargument name="errorString" type="string">
		<cfset local.errorJSON=deserializeJSON(errorString)/>
		<cfset local.message=errorJSON.error.errors[1].message/>
		<cfreturn message>
	</cffunction>
</cfcomponent>