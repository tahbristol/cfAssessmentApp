<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Shares</title>
		<link rel="shortcut icon" href="#">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="./css/style.css">
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
		<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.2/html5shiv.js"></script> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
		<style></style>
	</head>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<h1>Share Data</h1>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12">
					<div id="totalCounts"></div>

					<form id="getShares">
						<label>From:
							<input type="text" id="fromDate"/>
						</label>
						<label>To:
							<input type="text" id="toDate"/>
						</label>
						<input id="totalShares" class="btn btn-primary" type="submit" value="Get Shares">
					</form>

					<p>Or</p>

					<select id="timeSpan">
						<option value="day">Today</option>
						<option value="week">Last 7 Days</option>
					</select>
				</div>
			</div>
		</div>

		<div id="output">
		</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5a66447a69502e61"></script>
		<script src="./js/main.js"></script>

	</body>
</html>
