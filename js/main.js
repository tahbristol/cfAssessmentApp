function initAutocomplete() {
	let input = document.getElementById('addressToSearch');
	let autoComplete = new google.maps.places.Autocomplete(input);
}



$(document).ready(function(){
  $('form').on('submit', function(e){
		e.preventDefault();
		let address = $('#addressToSearch').val();
		let searchType = $('#searchType').val();

		let url = `https://www.googleapis.com/civicinfo/v2/${searchType === "officials" ? "representatives" : "voterinfo"}?address=${address}&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI`;
		$.get(url)
			.done((response) => {
				if (searchType === "officials"){
					let officials = JSON.stringify(response);
					$.post('./controllers/ajax.cfc?method=default',
						{
							officialsString: officials
						}
					).done((officialsArray) => {
						console.log(officialsArray);
					});
				}else if (searchType === "elections") {
					let elections = JSON.stringify(response);
					$.get('./controllers/ajax.cfc?method=default'
						{
							electionsString: elections
						}
					).done((electionsArray) => {
						console.log(electionsArray);
					});
				}

			})
	})


});
