$(document).ready(function() {
	$('form').on('submit', function(e) {
		let searchType;
		let userAddress = $('#addressToSearch').val();
		if ($('#searchElections').prop('checked')) {
			searchType = 'elections';
		} else {
			searchType = 'officials';
		}

		e.preventDefault();
		$.post('/cfAssessmentApp/index.cfm?action=main.search',

							{

							address: userAddress,
							search: searchType
							}

	)
		.done((data) => {
			console.log(data);
			$('.jumbotron').append(data);  //This appending works, however when I use the action=main.search url, the api returns an error of address. The same function
																		//in the default action does not cause this error.
			/*if (searchType === 'officials') {
				let jData = JSON.parse(data);
				$('#displayOfficials').html('');
				jData['OFFICIALSARRAY'].forEach(function(official) {
					displayOfficials(official);
				});
			}*/
		});
	});
});

function displayOfficials(data) {
	const officialsTmpl = $.templates('#officialsTmpl');
	const html = officialsTmpl.render(data);
	$('.jumbotron').append(html);
}

function displayElections(data) {
	const electionsTmpl = $.templates('#electionsTmpl');
	const html = electionsTmpl.render([data], getArray);
	$('.jumbotron').append(html);
}

function initAutocomplete() {  //for google autocomplte address function
	let input = document.getElementById('addressToSearch');
	let autoComplete = new google.maps.places.Autocomplete(input);
}
