import 'package:bwa_bank_frhan/models/siginin_form_model.dart';
import 'package:bwa_bank_frhan/models/signup_form_model.dart';
import 'package:bwa_bank_frhan/models/user_edit_form_model.dart';
import 'package:bwa_bank_frhan/models/user_model.dart';
import 'package:bwa_bank_frhan/services/auth_services.dart';
import 'package:bwa_bank_frhan/services/user_services.dart';
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

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());

          final user = await AuthServices().signin(event.data);

          emit(AuthSuccessLogin(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());

          final SigninFormModel data =
              await AuthServices().getCredentialFromLocal();
          final UserModel user = await AuthServices().signin(data);

          emit(AuthSuccessLogin(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccessLogin) {
            final updatedUser = (state as AuthSuccessLogin).user.copyWith(
              username: event.data.username,
              name: event.data.fullname,
              email: event.data.email,
              password: event.data.password
            );

            emit(AuthLoading());

            await UserServices().updateUser(event.data);

            emit(AuthSuccessLogin(updatedUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
