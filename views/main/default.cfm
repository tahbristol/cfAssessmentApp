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
					<input id="searchOfficials" type="radio" name="search" value="officials" <cfif isDefined("form.search") and rc.search is "officials">
									checked="checked"
								</cfif>/>
					Officials
				</label>
				<label>
					<input id="searchElections" type="radio" name="search" value="elections" <cfif isDefined("form.search") and rc.search is "elections">
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
		<div id="displayData"></div>
	</main>
	<div class="container">
		<div class="row>">
			<div class="col-sm-12">
				<div id="containSpinner">
				<img id="spinner" src="./images/Spinner-1s-200px.gif" />
			</div>
			</div>
		</div>
	</div>
</cfoutput>
