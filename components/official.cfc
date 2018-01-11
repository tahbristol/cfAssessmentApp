/**
 * ComponentName.cfc
 *
 * @author anonymous
 * @date date
 **/
component displayname="Official" accessors=true output=false persistent=false {
   function init(name, party, phone, website, position, email){
     this.name = name;
     this.party = party;
     this.phone = phone;
     this.website = website;
     this.position = position;
     this.email = email;
   }
}
