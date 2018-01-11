<cfscript>
function getElections(address){

  local.httpService = new http(method = "GET", url = "https://www.googleapis.com/civicinfo/v2/voterinfo?address=#address#?&key=AIzaSyD5JWZW3JJSHUYyE8wKCLUOnesa5Udd1AI ");
  local.result = httpService.send().getPrefix();
  local.goodData = deserializeJSON(result.filecontent);
  local.elections = goodData.election;
    local.userAddress = goodData.normalizedInput;
    local.dropOffLocations = arraySlice(goodData.dropOffLocations, 1,3); //only the first 3
    local.dropOffOne = dropOffLocations[1];
    local.dropOffTwo = dropOffLocations[2];
    local.dropOffThree = dropOffLocations[3];
    local.stateInfo = goodData.state[1];
    local.votingInfo = stateInfo.electionAdministrationBody;

    displayElection(elections,votingInfo,dropOffLocations);

    }

  

 function displayElection(elections,votingInfo,dropOffLocations){
  include "../views/elections/index.cfm";
 }
</cfscript>
