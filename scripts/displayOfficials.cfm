<cfscript>

  if(isDefined("form.address") and isDefined("form.search") and form.search is "officials"){
    include "../scripts/getOfficials.cfm";
    arrayEach(getOfficials(form.address), function(official){
      displayOfficial(official);
    });
  }else if (isDefined("form.address") and isDefined("form.search") and form.search is "elections") {
    include "../scripts/getElections.cfm";
  getElections(form.address);
  }
</cfscript>
