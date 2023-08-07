class Info{
  final String idnumber;
  final String nationality;
  final String document;
  final String city;
  final String name;
  final String email;

  const Info(
    this.city,
    this.email,
    this.name,
    this.idnumber,
    this.nationality,
    this.document,
  );

  Map<String,dynamic> toJson(){
    return{
     'idnumber':idnumber,
     'nationality':nationality,
     'document':document,
     'city':city,
     'name':name,
     'email':email,
    };
  }

  static Info fromJson(Map<String,dynamic>map){
    return Info(
      map ["idnumber"].toString(),
      map['nationality'],
      map['document'],
      map['city'],
      map["name"],
      map['email'],);
  }
}