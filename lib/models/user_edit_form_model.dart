class UserEditFormModel {
  final String? username;
  final String? fullname;
  final String? email;
  final String? password;

  UserEditFormModel({this.username, this.fullname, this.email, this.password});

 Map<String, dynamic> toJson(){
    return {
      'username' : username,
      'fullname' : fullname,
      'email' : email,
      'password' : password
    };
  }
}
