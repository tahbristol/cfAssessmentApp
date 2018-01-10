<cfscript>
  if(isDefined("form.address")){
    include "../scripts/getOfficials.cfm";
    local.officials = getOfficials(form.address);
    arrayEach(officials, function(official){
      displayOfficial(official);
    });
  }
</cfscript>
