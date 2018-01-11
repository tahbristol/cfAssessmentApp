<cfoutput>
  <form id="address" method="post" action="">
    <div id="addressInput" class="form-group">
      <label for="address">Address</label>
      <cfif isDefined("form.address")>
        <input class="form-control" id="addressToSearch" name="address" placeholder="Address..." value="#form.address#"/>
      <cfelse>
        <input class="form-control" id="addressToSearch" name="address" placeholder="Address..." value=""/>
      </cfif>
      <small class="form-text text-muted">Enter an address to find your representatives.</small><br>
      <small class="form-text text-muted">We will not save your address, Promise!</small>
    </div>
    <button class="btn btn-primary" type="submit" value="address">Search</button>
  </form>
</cfoutput>
