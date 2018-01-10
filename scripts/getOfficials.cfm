<cfscript>
  address = "20190";
  apiKey = "AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI";
  qUrl = "https://www.googleapis.com/civicinfo/v2/representatives?address=#address#&key=#apiKey#";
  httpService = new http(method = "GET", url = qUrl);
  result = httpService.send().getPrefix();
  goodData = deserializeJSON(result.filecontent);
  officials = goodData.Officials;
  offices = goodData.offices;
  divisions = goodData.divisions;

  arrayEach(offices, function (office) {
    arrayEach(office["officialIndices"], function (index) {
      official = StructNew();

      if (StructKeyExists(officials[index + 1], "emails")) {
        official.email = officials[index + 1]["emails"][1];
      } else {
        official.email = "unknown";
      }

      official.name = officials[index + 1].name;
      official.party = officials[index + 1].party;
      official.phone = officials[index + 1]["phones"][1];
      official.url = officials[index + 1]["urls"][1];
      official.position = office["name"];
      include "../views/officials/index.cfm";
    });
  });
</cfscript>
