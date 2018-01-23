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
		$.post('/cfAssessmentApp/index.cfm?action=main.search', {
				address: userAddress,
				search: searchType
			})
			.done((data) => {
				console.log(data);
				$('#displayData').html(data);
			});
	});
});

function initAutocomplete() { //for google autocomplte address function
	let input = document.getElementById('addressToSearch');
	let autoComplete = new google.maps.places.Autocomplete(input);
}
