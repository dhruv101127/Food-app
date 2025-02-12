import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/wrapper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
    Get.offAll(Wrapper());
  }

  signupGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
            child: Column(
              children: [
                Text("Welcome",
                    style: TextStyle(fontSize: 50, color: Colors.white)),
                SizedBox(height: 30),
                // TextField(
                //   decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Colors.grey[800],
                //       label: Text(
                //         "Username",
                //         style: TextStyle(color: Colors.white),
                //       )),
                // ),
                SizedBox(height: 30),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.grey[700],
                      label: Text(
                        "Email",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.grey[700],
                      label: Text(
                        "Choose password",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(height: 30),
                // TextField(
                //   decoration: InputDecoration(
                //       filled: true,
                //       fillColor: Colors.grey[800],
                //       label: Text(
                //         "Re-enter Password",
                //         style: TextStyle(color: Colors.white),
                //       )),
                // ),
                SizedBox(height: 50),
                ElevatedButton(
                    onPressed: (() {
                      if (email.text == "") {
                        Get.snackbar("Error", "Please give credentials",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2));
                      } else {
                        signUp();
                      }
                    }),
                    child: Text(
                      "SignUp",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                Divider(height: 50),
                Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.white),
                ),
                // SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    signupGoogle();
                  },
                  child: Image.asset(
                    "assets/google.png",
                    height: 60,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed("/");
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
