
class LoginPostModel {
  LoginPostModel({
  required  this.email,
  required  this.password,
  });

  String email;
  String password;


  Map<String, dynamic> toJson() => {
    "Email":  email,
    "Password": password,
  };
}
