<cfscript>
  if(isDefined("form.address")){
    include "../scripts/getOfficials.cfm";  
    arrayEach(getOfficials(form.address), function(official){
      displayOfficial(official);
    });
  }
</cfscript>
