<cfscript>
  if(isDefined("form.address")){ 
    include "../scripts/getOfficials.cfm";
    officials = getOfficials(form.address);
    arrayEach(officials, function(official){
      displayOfficial(official);
    });
  }
</cfscript>
