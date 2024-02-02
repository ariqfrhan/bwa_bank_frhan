part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailed extends AuthState {
  final String e;
  const AuthFailed(this.e);

  @override
  List<Object> get props => super.props;
}

final class AuthSuccess extends AuthState {}

final class AuthSuccessRegister extends AuthState{
  final UserModel user;
  const AuthSuccessRegister(this.user);

  @override
  List<Object> get props => [user];
}

final class AuthSuccessLogin extends AuthState{
  final UserModel user;
  const AuthSuccessLogin(this.user);

  @override
  List<Object> get props => [user];
}
