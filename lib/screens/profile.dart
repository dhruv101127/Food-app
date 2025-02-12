import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  signout() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/profile_default.jpeg"),
                  foregroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ?? ""),
                ),
              ],
            ),
            SizedBox(height: 50),
            Column(
              spacing: 40,
              children: [
                Divider(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("User name -"),
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email -"),
                    Text(
                      FirebaseAuth.instance.currentUser!.email ?? "",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                    ),
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          contentPadding: EdgeInsets.all(20),
                          title: "Logout",
                          titleStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          middleText: "Do you want to Logout?",
                          middleTextStyle: TextStyle(fontSize: 17),
                          cancel: IconButton(
                              style: IconButton.styleFrom(
                                  foregroundColor: Colors.red, iconSize: 30),
                              onPressed: () {
                                navigator!.pop();
                              },
                              icon: Icon(Icons.cancel_outlined)),
                          confirm: IconButton(
                              onPressed: () {
                                signout();
                                navigator!.pop();
                              },
                              icon: Icon(Icons.done),
                              style: IconButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  iconSize: 30)));
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
