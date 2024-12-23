// ignore_for_file: file_names
//ignore_for_file: non_constant_identifier_names
//ignore_for_file: prefer_typing_uninitialized_variables

class Client{
  var ID_client;
  var name;
  var surname;
  var Tel;
  var e_mail;
  var Producion;
  Client(this.ID_client, this.surname, this.name, this.Producion, this.Tel, this.e_mail);

  Map<String, dynamic> toMap() {
    return {
      'ID Client': ID_client,
      'Nom' : surname,
      'Prénom' : name,
      'Production' : Producion,
      'Numéro de Teléphone': Tel,
      'Adresse E-Mail': e_mail,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) => Client(
    map["ID Client"],
    map['Nom'],
    map['Prénom'],
    map['Production'],
    map['Numéro de téléphone'],
    map['Adresse E-Mail'],
    );
}