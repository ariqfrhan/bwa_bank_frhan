class SigninFormModel {
  final String? email;
  final String? password;

  SigninFormModel({this.email, this.password});

  Map<String, dynamic> toJson(){
    return {
      'email' : email,
      'password' : password
    };
  }
}
