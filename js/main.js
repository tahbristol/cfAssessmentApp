$(document).ready(function() {
	$('form').on('submit', function(e) {
		let searchType;
		let address = $('#addressToSearch').val();
		if ( $('#searchElections').prop('checked')){
		 searchType = "elections";
		}else{
			searchType = "officials";
		}

		console.log(searchType);
		e.preventDefault();
		let url = `https://www.googleapis.com/civicinfo/v2/${searchType === "officials" ? "representatives" : "voterinfo"}?address=${address}&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI`;

		$.get(url)
			.done((response) => {
				if (searchType === "officials") {
					let officials = JSON.stringify(response);
					$.post('./controllers/ajax.cfc?method=search',
					 	{
							officialsString: officials
						}
					)
					.done((data) => {
						let jData = JSON.parse(data);
						document.getElementById('displayOfficials').innerHTML = "";
						jData["OFFICIALSARRAY"].forEach(function(official) {
							makeDisplayTemplate(official);
						});
					});
				} else if (searchType === "elections") {
					let elections = JSON.stringify(response);
					$.get('./controllers/ajax.cfc?method=default', {
						electionsString: elections
					}).done((electionsArray) => {});
				}
			})
	})


});

function makeDisplayTemplate(data) {
	const officialsTmpl = $.templates("#officialsTmpl");
	const html = officialsTmpl.render(data);
	$('#displayOfficials').append(html);
}

function initAutocomplete() {
	let input = document.getElementById('addressToSearch');
	let autoComplete = new google.maps.places.Autocomplete(input);
}
