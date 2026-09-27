import 'package:supabase_flutter/supabase_flutter.dart';

class Auth {
  Future<AuthResponse> signup({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    var supabase = Supabase.instance.client;
    final response = await supabase.auth.signUp(
      password: password,
      email: email,
    );
    if (response.user != null) {
      var h = await supabase.from('profile').insert({
        "phone": phone,
        "name": name,
        "id_auth": response.user!.id,
      });
      print("===============${h}");
    }

    print("===============${response.user?.id.toString()}");

    return response;
  }

  Future<AuthResponse> signin(String email, String password) async {
    var supabase = Supabase.instance.client;
    final response = await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );

    return response;
  }
}
