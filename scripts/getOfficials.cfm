<cfscript>
  function getOfficials(address){
    local.apiKey = "AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI";
    local.qUrl = "https://www.googleapis.com/civicinfo/v2/representatives?address=#address#&key=#apiKey#";
    local.httpService = new http(method = "GET", url = qUrl);
    local.result = httpService.send().getPrefix();
    local.goodData = deserializeJSON(result.filecontent);
    local.officials = goodData.Officials;   //without local. variables are global....bad.
    local.offices = goodData.offices;
    local.divisions = goodData.divisions;
     return makeOfficialStruct(officials,offices,divisions);

    }

    function makeOfficialStruct(officials,offices,divisions){
      local.officialsArray = [];
      arrayEach(offices, function (office) {
        arrayEach(office["officialIndices"], function (index) {
          local.official = StructNew();

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
          arrayAppend(officialsArray, official);
        });
      });
     return officialsArray;
    }

    function displayOfficial(official){
      include "../views/officials/index.cfm";
    }
</cfscript>
