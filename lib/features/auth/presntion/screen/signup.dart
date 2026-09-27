import 'package:ecom/features/auth/data/auth.dart';
import 'package:ecom/features/auth/presntion/cubit/signup_cubit.dart';
import 'package:ecom/features/auth/presntion/cubit/signup_state.dart';
import 'package:ecom/features/auth/presntion/screen/Sigin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController repassword = TextEditingController();

  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  GlobalKey<FormState> f = GlobalKey<FormState>();
  bool pass = true;
  bool pass1 = true;
  bool a = false;

  bool check = false;

  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 251, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 251, 255),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Form(
        key: f,
        child: ListView(
          children: [
            // SizedBox(height: 100),
            Image.asset(
              height: 120,
              width: 50,
              "assets/Bags Happy Sticker - Bags Happy Peace - Discover & Share GIFs.gif",
            ),
            Center(
              child: Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                "Sign up to get started",
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
            ),
            BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                return Card(
                  elevation: 10,
                  color: Colors.white,
                  margin: EdgeInsets.only(
                    bottom: 30,
                    left: 14,
                    right: 14,
                    top: 30,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Full Name",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "you cant let the field empty";
                            }
                          },
                          controller: userName,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 16,
                              bottom: 6,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 224, 222, 222),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hint: Text(
                              "Enter your full name",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          " Phone Number",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "you cant let the field empty";
                            }
                          },
                          controller: phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 16,
                              bottom: 6,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 224, 222, 222),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_in_talk,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hint: Text(
                              "Enter your phone number",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 12),
                        Text(
                          " Email",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "you cant let the field empty";
                            }
                          },
                          controller: email,
                          decoration: InputDecoration(
                            errorText: state is SignupError
                                ? state.messg
                                : null,
                            contentPadding: EdgeInsets.only(
                              left: 16,
                              bottom: 6,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 224, 222, 222),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hint: Text(
                              "Enter your email",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          " Password",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          obscureText: pass,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "you cant let the field empty";
                            } else if (value.length < 8) {
                              return "Password should have at lees 8 letter";
                            }
                          },
                          controller: password,

                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 224, 222, 222),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            contentPadding: EdgeInsets.only(
                              left: 16,
                              bottom: 6,
                            ),
                            iconColor: Colors.grey,
                            suffixIcon: IconButton(
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  pass = !pass;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: pass ? Colors.grey : Colors.purple,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            hint: Text(
                              "Create a password",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          " Confirm Password",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          obscureText: pass1,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "you cant let the field empty";
                            } else if (value.length < 8) {
                              return "Password should have at lees 8 letter";
                            }
                          },
                          controller: repassword,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 16,
                              bottom: 6,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 224, 222, 222),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  pass1 = !pass1;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: pass1 ? Colors.grey : Colors.purple,
                              ),
                            ),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hint: Text(
                              "Confirm your password",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Checkbox(
                              side: BorderSide(color: Colors.grey),
                              value: check,
                              onChanged: (y) {
                                setState(() {
                                  check = y!;
                                });
                              },
                            ),
                            Text.rich(
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              TextSpan(
                                text: "I agree to the",

                                children: [
                                  TextSpan(
                                    text: " Terms of Service",
                                    style: TextStyle(color: Colors.deepPurple),
                                  ),
                                  TextSpan(text: " and "),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(color: Colors.deepPurple),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<SignupCubit, SignupState>(
                          builder: (context, st) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(
                                  MediaQuery.widthOf(context),
                                  50,
                                ),
                                backgroundColor: Colors.purple,
                              ),
                              onPressed: () async {
                                switch (st) {
                                  case Signupinti _:
                                    if (f.currentState!.validate()) {
                                      if (password.text == repassword.text) {
                                        if (check) {
                                          await context
                                              .read<SignupCubit>()
                                              .signup(
                                                email: email.text,
                                                password: password.text,
                                                name: userName.text,
                                                phone: phone.text,
                                              );
                                          if (st is SignupLoaded) {
                                            Navigator.of(
                                              context,
                                            ).pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) => Sigin(),
                                              ),
                                            );
                                          }
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.grey,
                                              content: Text(
                                                "You have to agree the Terms",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.grey,
                                            content: Text(
                                              "Password dont match with confirm password",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                    ;
                                  case SignupLoaded _:
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => Sigin(),
                                      ),
                                    );
                                  case SignupError _:
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(st.messg)),
                                    );
                                  case SignupLoading _:
                                    a = true;
                                }
                              },
                              child: a
                                  ? Center(child: CircularProgressIndicator())
                                  : Text(
                                      "Sign Up",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
