<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Civically Engaged</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="./css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
		<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
		<style></style>
	</head>
	<body>
		<cfoutput>
			#body#
		</cfoutput>
		<div id="displayOfficials"></div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script src="./js/main.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
		<script id="civic" type="text/x-handlebars-template">
			<div id="body" class="container card">
				<div class="row">
					<div class="col-sm-12">
						<div class="thumbnail">
							{{#if photo}}
								<img src="{{photo}}" alt="photo of {{name}}"/>
							{{/if}}
							<div class="caption">
								<h3>
									{{name}}</h3>
								<p>
									{{position}}</p>
								<p>
									{{party}}</p>
								<p>
									{{email}}</p>
								<p>
									{{phone}}</p>
								<a href="{{website}}" target="_blank">Website</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZWJBrVt-tKatWxvN0S2fiihF2H4oRT20&libraries=places&callback=initAutocomplete" async="async" defer="defer"></script>
	</body>
</html>
