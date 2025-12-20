class PassengerModel {
  final String id;
  final String type;
  final String title;
  final String givenName;
  final String familyName;
  final String email;
  final String phoneNumber;
  final String bornOn;
  final String gender;

  PassengerModel({
    required this.id,
    required this.type,
    required this.title,
    required this.givenName,
    required this.familyName,
    required this.email,
    required this.phoneNumber,
    required this.bornOn,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "title": title,
      "given_name": givenName,
      "family_name": familyName,
      "email": email,
      "phone_number": phoneNumber,
      "born_on": bornOn,
      "gender": gender,
    };
  }
}
