// ignore_for_file: file_names
//ignore_for_file: non_constant_identifier_names
//ignore_for_file: prefer_typing_uninitialized_variables
class Chauffeur{
  var ID_chauffeur;
  var nickname;
  var name;
  var surname;
  var Tel;
  var e_mail = "";
  var vehicul_type;
  var plaque;
  Chauffeur(this.ID_chauffeur, this.nickname,this.surname, this.name, this.Tel, this.e_mail, this.vehicul_type, this.plaque);

  Map<String, dynamic> toMap() {
    return {
      'ID chauffeur': ID_chauffeur,
      'Surnom': nickname,
      'Nom' : surname,
      'Prénom' : name,
      'Numéro de Teléphone': Tel,
      'Adresse E-Mail': e_mail,
      'Type de Véhicule': vehicul_type,
      'Plaque': plaque,
    };
  }

  factory Chauffeur.fromMap(Map<String, dynamic> map) => Chauffeur(
    map["ID chauffeur"],
    map['Surnom'],
    map['Nom'],
    map['Prénom'],
    map['Numéro de téléphone'],
    map['Adresse E-Mail'],
    map['Type de Véhicule'],
    map['Plaque'],
    );
}