class Customers{
  final String idnumber;
  final String nationality;
  final String document;

  const Customers(
    this.idnumber,
    this.nationality,
    this.document,
  );

  Map<String,dynamic> toJson(){
    return{
     'idnumber':idnumber,
     'nationality':nationality,
     'document':document,
    };
  }

  static Customers fromJson(Map<String,dynamic>data){
    return Customers(
      data ["idnumber"].toString(),
      data['nationality'],
      data['document']);
  }
}