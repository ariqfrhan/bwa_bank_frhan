part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent{
  final String email;
  const AuthCheckEmail(this.email);

  @override
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent{

  final SignupFormModel data;
  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent{

  final SigninFormModel data;
  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogout extends AuthEvent{}

class AuthGetCurrentUser extends AuthEvent{}

class AuthUpdateUser extends AuthEvent{
  final UserEditFormModel data;
  const AuthUpdateUser(this.data);

  @override
  List<Object> get props => [data];
}
class AuthUpdatePIN extends AuthEvent{
  final String oldpin;
  final String newpin;
  const AuthUpdatePIN(this.oldpin, this.newpin);

  @override
  List<Object> get props => [oldpin, newpin];
}