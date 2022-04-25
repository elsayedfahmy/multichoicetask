


class RegisterPostModel {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final List<String> roles;


  RegisterPostModel({required this.fullName,required this.email,required this.password,required this.phoneNumber,required this.roles});

  Map<String, dynamic> toJson() => {
    "FullName": fullName,
    "Email":  email,
    "Password":  password,
    "PhoneNumber": phoneNumber,
    "Roles":  List<dynamic>.from(roles.map((x) => x)),
  };
}

