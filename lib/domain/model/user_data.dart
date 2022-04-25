
import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));
class UserData {
  UserData({
  required  this.fullName,
   required this.email,
   required this.userName,
   required this.id,
   required this.dateCreated,
   required this.token,
   required this.roles,
  });

  String fullName;
  String email;
  String userName;
  String id;
  String dateCreated;
  String token;
  List<String> roles;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    fullName: json["fullName"],
    email: json["email"],
    userName: json["userName"],
    id: json["id"],
    dateCreated: json["dateCreated"],
    token: json["token"],
    roles: json["roles"] == null ? [] : List<String>.from(json["roles"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "userName": userName,
    "id": id,
    "dateCreated": dateCreated ,
    "token":  token,
    "roles": List<dynamic>.from(roles.map((x) => x)),
  };
}


