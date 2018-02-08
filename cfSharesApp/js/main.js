$(document).ready(function(){

	$('form').on('submit', function(e) {
		let siteId = "";
		let lettergroupId = "";
		let d = new Date();
		let today = new Date();
		let tomorrow = new Date();
		let fromDate = $('#fromDate').val();
		let toDate = $('#toDate').val();
		let timeSpan = $('#timeSpan').val();

		if (timeSpan && timeSpan === 'week' && !fromDate && !toDate) {
			d.setDate(d.getDate() - 7);//setting d to the date 7 days ago
			let weekAgo = d;
			rangeCounts(weekAgo,today,siteId,lettergroupId);
		}
		else if (timeSpan && timeSpan === 'day' && !fromDate && !toDate) { //today, not the last 24 hours
			d.setDate(d.getDate() + 1);
			let dayAhead = d;
			rangeCounts(today,dayAhead,siteId,lettergroupId);
		}
		else {
			fromDate = new Date($('#fromDate').val());
			toDate = new Date($('#toDate').val());
			rangeCounts(fromDate,toDate,siteId,lettergroupId);
		}
		e.preventDefault();
	});

});


/*** Function Declarations ***/
function getShareData(evt) {
	let d = new Date();
	let now = d.toJSON();
	parseShareData(evt.data, now);
}

function parseShareData(shareData, timestamp) {
	let url = "http://www.congressweb.com/dl3579o/87?framslkejfi_lirgfilsdm"; //shareData.url;
	let baseUrl, siteId, lettergroupId, frameParent;

	if (url.includes("?")) {
		[baseUrl, siteId, lettergroupId, frameParent] = url.split(/\/(\w+)\/(\w+)\?(.+)/); //this will need to be changed on testing
	}
	else {
		[baseUrl, siteId, lettergroupId] = url.split(/\/(\w+)\/(\w+)/);
		frameParent = "";
	}

	let parsedData = {
		service: shareData.service,
		siteId: siteId,
		lettergroupId: lettergroupId,
		frameParent: frameParent,
		time: timestamp
	}
	updateDb(parsedData);
}


function updateDb(data) {
	$.post('/cfSharesApp/index.cfm?action=main.updateShares', {
			shareData: JSON.stringify(data)
		})
		.done((response) => {
			//do something?
		});
}


function rangeCounts(from, to, siteId, lettergroupId) {
		$.post('/cfSharesApp/index.cfm?action=main.rangeShares', {
				fromDate: from.toJSON().split("T")[0],
				toDate: to.toJSON().split("T")[0],
				siteId: siteId,
				lettergroupId: lettergroupId
			})
			.done((shareCountRes) => {
				$('.statsContainer').html(shareCountRes);
			});
}




/**** On addthis share menu event ****/
addthis.addEventListener('addthis.menu.share', getShareData);
//addthis.addEventListener('addthis.user.clickback', addthisClick); Tracks if a visitor came from a previously shared link.
/* ToDo
	1. parse url for siteID and lettergroupID
	    a. Regex test
	2. Timestamp -done
	3. Call cfc to update db -done
	4. Get url from shareData.url
	5. Scope the queries to url(s) once inside the admin
	6. Display
	7. Automatic data update on time frame change
	*/
