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
	} else {
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


/**** Count Stats Functions ****/
function rangeCounts(from, to) {
		$.post('/cfSharesApp/index.cfm?action=main.rangeShares', {
				fromDate: from.toJSON(),
				toDate: to.toJSON()
			})
			.done((shareCountRes) => {
				console.log(shareCountRes)
				$('#output').html(shareCountRes);
			});
}


function dayCounts(){
		$.post('/cfSharesApp/index.cfm?action=main.dayShares')
			.done((shareCountRes) => {
				console.log(shareCountRes)
			});
}


$('form').on('submit', function(e) {
	let d = new Date();
	d.setDate(d.getDate() - 7); //setting d to the date 7 days ago
	let today = new Date();
	let weekAgo = d;
	let fromDate = $('#fromDate').val();
	let toDate = $('#toDate').val();
	let timeSpan = $('#timeSpan').val();

	if (timeSpan && timeSpan === 'week') {
		rangeCounts(weekAgo,today);
	}
	else if (timeSpan && timeSpan === 'day') {
		dayCounts();
	} else {

	}
	e.preventDefault();
})

/**** On addthis share menu event ****/
addthis.addEventListener('addthis.menu.share', getShareData);
//addthis.addEventListener('addthis.user.clickback', addthisClick); Tracks if a visitor came from a previously shared link.
/*
	1. parse url for siteID and lettergroupID
	2. Timestamp
	3. Call cfc to update db
	*/
