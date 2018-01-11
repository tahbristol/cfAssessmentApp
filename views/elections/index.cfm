<cfoutput>
  <div id="body" class="container">
    <div class="row">
      <div class="col-sm-4">
        <h3>Election</h3>
        <h5>#elections.name#</h5>
        <h5>Date: #elections.electionDay#</h5>
      </div>
      <div class="col-sm-4">
        <ul>
           <h3>Voting Help</h3>
          <li><a href="#votingInfo.ballotInfoUrl#">Ballot Info</a></li>
          <li><a href="#votingInfo.electionRegistrationUrl#">Register</a></li>
          <li><a href="#votingInfo.electionRulesUrl#">Voting Rules</a></li>
        </ul>
      </div>

      <div class="col-sm-4">
        <ul>
          <h3>Ballot Drop Off Locations</h3>
          <li>#dropOffLocations[1].address.locationName#</li>
          <li>#dropOffLocations[1].address.line1#</li>
          <li>#dropOffLocations[1].address.city#, #dropOffLocations[1].address.state# #dropOffLocations[1].address.zip#</li>
          <li></li>
          <li></li>

        </ul>
      </div>

    </div>
  </div>


</cfoutput>
