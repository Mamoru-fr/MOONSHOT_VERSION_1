// ignore_for_file: file_names
//ignore_for_file: non_constant_identifier_names
//ignore_for_file: prefer_typing_uninitialized_variables

class Fare {
  final int ID_fare;
  late final String title;
  final String Date;
  final String Hour;
  final int ID_client;
  final String Category;
  final int ID_depart;
  final int ID_arrive;
  final String payement;
  final String option;

  Fare(this.ID_fare, this.title, this.Date, this.Hour, this.ID_client, this.Category, this.ID_depart, this.ID_arrive, this.payement, this.option);

  Map<String, dynamic> toMap() {
    return {
      'ID_fare': ID_fare,
      'title': title,
      'Date': Date,
      'Hour': Hour,
      'ID_client': ID_client,
      'Category': Category,
      'ID_depart': ID_depart,
      'ID_arrive': ID_arrive,
      'payement': payement,
      'option': option,
    };
  }

  factory Fare.fromMap(Map<String, dynamic> map) {
    return Fare(
      map['ID_fare'],
      map['title'],
      map['Date'],
      map['Hour'],
      map['ID_client'],
      map['Category'],
      map['ID_depart'],
      map['ID_arrive'],
      map['payement'],
      map['option'],
    );
  }
}