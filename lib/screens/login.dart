import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/wrapper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
    Get.offAll(Wrapper());
  }

  loginGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    debugPrint("login wrapper");
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Food delivery",
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.amber,
                          fontFamily: "PinyonScript"),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
                  child: Column(
                    children: [
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[700],
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Email",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[700],
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: (() {
                          if (email.text == "") {
                            Get.snackbar("Error", "Please give credentials",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2));
                          } else {
                            signIn();
                          }
                        }),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Divider(height: 60),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.white),
                      ),
                      // SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          loginGoogle();
                        },
                        child: Image.asset(
                          "assets/google.png",
                          height: 60,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed("/signup");
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
                SizedBox(height: 70),
                TextButton(
                    onPressed: () {
                      Get.snackbar("In Development", "come back later",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red[200]);
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.grey[300]),
                    ))
              ],
            ),
          ),
        ));
  }
}
