import 'package:ecom/features/auth/data/auth.dart';
import 'package:ecom/features/auth/presntion/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(Signupinti());
  Auth auth = Auth();
  signup({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(SignupLoading());
    try {
      var sig = await auth.signup(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      if (sig.user != null && sig.session != null) {
        emit(SignupLoaded());
      } else {
        print(sig.user?.id);
        emit(Signupinti());
      }
    } on AuthApiException catch (e) {
      print("${e.message}");

      emit(SignupError(messg: e.message));

      switch (e.message) {
        case "duplicate key value violates unique constraint":
          emit(
            SignupError(
              messg: "duplicate key value violates unique constraint",
            ),
          );
          break;
        case "over email send":
          emit(SignupError(messg: "over email send"));

          break;
        case "Invalid login credentials":
          emit(SignupError(messg: "Invalid login credentials"));

          break;
        case "Email not confirmed":
          emit(SignupError(messg: "Email not confirmed"));

          break;
        case "User not confirmed":
          {
            emit(SignupError(messg: "User not confirmed"));
          }
          break;
        case "User already registered":
          emit(SignupError(messg: "User already registered"));
          break;
        default:
          emit(SignupError(messg: e.message));
      }
    } catch (e) {
      print("================$e");
      emit(SignupError(messg: " an known Error"));
    }
  }
}
