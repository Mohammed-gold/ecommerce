import 'package:ecom/features/auth/presntion/cubit/signin_cubit.dart';
import 'package:ecom/features/auth/presntion/cubit/signin_state.dart';
import 'package:ecom/features/auth/presntion/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sigin extends StatefulWidget {
  Sigin({Key? key}) : super(key: key);

  @override
  State<Sigin> createState() => _SiginState();
}

class _SiginState extends State<Sigin> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool pass = false;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  var autu = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 251, 255),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 254, 251, 255)),
      body: Form(
        key: globalKey,

        child: ListView(
          padding: EdgeInsets.all(0),

          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 20,
                right: 20,
                bottom: 27,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sign in to continue to your account ",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Image.asset(
                    height: 100,
                    width: 105,
                    "assets/Illustration — Lauren Jane Studio __ Art & Design Services in Los Angeles, California.gif",
                  ),
                ],
              ),
            ),

            BlocBuilder<SigninCubit, SigninState>(
              builder: (context, state) {
                return Card(
                  elevation: 8,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          onChanged: (_) {
                            if (state is SigninError) {
                              context.read<SigninCubit>().sigclear();
                            }
                          },

                          validator: (value) {
                            if (value!.isEmpty) {
                              return "you cant let the field empty";
                            }
                            // if (state is SigninError) {
                            //   return state.massage;
                            // }
                          },
                          controller: email,
                          decoration: InputDecoration(
                            errorText: state is SigninError
                                ? state.massage
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
                            return null;
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
                        SizedBox(height: 8),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Forget password ?",
                            style: TextStyle(color: Colors.purple),
                          ),
                        ),

                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(MediaQuery.widthOf(context), 50),
                            backgroundColor: Colors.purple,
                          ),
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              context.read<SigninCubit>().signin(
                                email.text,
                                password.text,
                                context,
                              );

                              autu = AutovalidateMode.onUserInteraction;
                            }
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?"),
                SizedBox(width: 7),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
