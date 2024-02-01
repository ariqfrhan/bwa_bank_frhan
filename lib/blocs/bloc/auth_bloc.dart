
import 'package:bwa_bank_frhan/models/signup_form_model.dart';
import 'package:bwa_bank_frhan/models/user_model.dart';
import 'package:bwa_bank_frhan/services/auth_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthServices().checkEmail(event.email);
          if (res == false) {
            emit(AuthSuccess());
          } else {
            emit(const AuthFailed(
                'Email sudah terpakai, harap memakai email unik'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          final user = await AuthServices().register(event.data);

          emit(AuthSuccessRegister(user));
          
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
