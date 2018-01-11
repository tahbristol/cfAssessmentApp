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
      local.officialInfoFields = ["name","party","phones","urls","emails","position"];
      local.officialsArray = [];
      arrayEach(offices, function (office) {
        arrayEach(office["officialIndices"], function (index) {
          local.official = StructNew();
            arrayEach(officialInfoFields, function(infoField){
               if (StructKeyExists(officials[index + 1], infoField)){
                 if(infoField IS "phones" || infoField IS "emails" || infoField IS "urls"){
                   official[infoField] = officials[index + 1][infoField][1];
                 } else {
                   official[infoField] = officials[index + 1][infoField];
                 }
               } else {
                 official[infoField] = "Unknown";
               }

              });
          arrayAppend(officialsArray, official);
        });
      });

     return officialsArray;
    }

    function displayOfficial(official){
      
      include "../views/officials/index.cfm";
    }
</cfscript>
