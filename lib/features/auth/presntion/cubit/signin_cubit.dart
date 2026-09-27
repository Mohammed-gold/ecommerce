import 'package:ecom/features/auth/data/auth.dart';
import 'package:ecom/features/auth/presntion/cubit/signin_state.dart';
import 'package:ecom/features/view_prodect/presentation/pages/Product_viwe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());
  Auth auth = Auth();

  sigclear() {
    emit(SigninError(massage: null));
  }

  signin(String email, String password, BuildContext context) async {
    emit(SigninLoading());
    try {
      AuthResponse sigin = await auth.signin(email, password);
      if (sigin.user != null && sigin.session != null) {
        emit(SigninSuccess(massage: "login success"));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProductViwe()),
        );
      }
    } on AuthException catch (e) {
      print("===============${e.message}");
      switch (e.message) {
        case "Invalid login credentials":
          {
            emit(SigninError(massage: "Invalid login credentials"));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invalid login credentials")),
            );
          }
          break;
        case "Email not confirmed":
          {
            emit(SigninError(massage: "Email not confirmed"));
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Email not confirmed")));
          }
          break;
        case "User not confirmed":
          {
            emit(SigninError(massage: "User not confirmed"));
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("User not confirmed")));
          }
          break;
        case "User already registered":
          emit(SigninError(massage: "User already registered"));
          break;
        default:
          emit(SigninError(massage: "an known Error"));
      }
    }
  }
}
