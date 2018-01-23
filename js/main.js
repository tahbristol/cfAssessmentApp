
$(document).ready(function() {
  $('#containSpinner').hide();
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

				$('#displayData').html(data);
			});
	});
});

$(document).ajaxStart(function(){
	$('#displayData').html("");
	$('#containSpinner').show();
});

$(document).ajaxComplete(function(){
	$('#containSpinner').hide();
})
function initAutocomplete() { //for google autocomplte address function
	let input = document.getElementById('addressToSearch');
	let autoComplete = new google.maps.places.Autocomplete(input);
}
