<main class="jumbotron">
  <div id="message" class="col-sm-12">
      <p>Message</p>
  </div>
  <h4>Ready to get involved? Find your representatives Here!</h4>
  <cfinclude template="./forms/addressForm.cfm">
  <div id="searchError" class="col-sm-12">
    <p></p>
  </div>
  <cfinclude template="../scripts/getOfficials.cfm">
  <cfinclude template="./forms/sendTextForm.cfm">
</main>
