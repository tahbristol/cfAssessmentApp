<cfoutput>
  
  <div id="body" class="container">
    <div class="row">

      <div class="col-sm-4">
        <h3>
          #official.name#</h3>
        <h5>
          #official.position#</h5>
      </div>

      <div class="col-sm-4">
        <p>
          Party: #official.party#</p>
        <p>
          Email: #official.email#</p>
        <p>
          Phone: #official.phone#</p>
        <a href="" target="_blank">
          Website</a>
      </div>

      <div class="col-sm-4">
        <input id="sendOfficial" name="officials[to_send][]" value={{id} }="}" type="checkbox"/>
        <p>
          Text this info?</p>
      </div>

    </div>
  </div>

  <hr>
</cfoutput>
