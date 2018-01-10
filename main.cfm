<main class="jumbotron">

    <div id="message" class="col-sm-12">
      <p>Message</p>
    </div>

  <h4>Ready to get involved? Find your representatives Here!</h4>

  <form id="address" method="post">
    <div id="addressInput" class="form-group">
      <label for="address">Address</label>
      <input class="form-control" id="addressToSearch" name="address" placeholder="Address..."/>
      <small class="form-text text-muted">Enter an address to find your representatives.</small><br>
      <small class="form-text text-muted">We will not save your address, Promise!</small>
    </div>
    <button class="btn btn-primary" type="submit">Search</button>
  </form>

  <div id="searchError" class="col-sm-12">
    <p></p>
  </div>

  <cfinclude template="script.cfm">

  <form id="phone" action='/officials/send' method="post">
    <div class="officials"></div>
    <div id="phoneInput" class="form-group">
      <label for="toPhoneNumber">Phone number</label>
      <input class="form-control" id="toPhoneNumber" name="toNumber" placeholder="Mobile number..."/>
      <small class="form-text text-muted">Place a check to send to your phone.</small>
    </div>
    <button class="btn btn-primary" type="submit">Send</button>
  </form>

</main>
