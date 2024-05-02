class ContactModel {
   String? name;
   String? email;
   int? phone;
   String? id;
   String? address;

  ContactModel(this.address,
      { this.name,
       this.email,
       this.phone,
       this.id});

   ContactModel.fromjson(Map<String,dynamic>json) {
    name =json["name"];
    email = json["email"];
     phone = json["phone"] ;
     id = json["_id"];
    address = json["address"];
    
  }
 
}
