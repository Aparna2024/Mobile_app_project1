class User {
  final int? id;
  final String username;
  final String password;
  final String emailId;
  final String streetAddress;
  final String city;
  final String zipCode;

  User({this.id,
    required this.username,
    required this.password,
    required this.emailId,
    required this.streetAddress,
    required this.city,
    required this.zipCode
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'emailId': emailId,
      'streetAddress': streetAddress,
      'city': city,
      'zipCode': zipCode
    };
  }
}
