import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/model/api_model.dart';
import 'package:food_delivery/services/api_services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Model> model = [];
  _HomeScreenState() {
    ApiServices().getModel().then((value) {
      setState(() {
        if (value != null) {
          model = value;
        }
      });
    }).onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "FOOD MENU",
            style: TextStyle(
                color: Colors.white, fontFamily: "Gloria", fontSize: 35),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: "Snacks",
              ),
              Tab(
                text: "Main course",
              ),
              Tab(
                text: "Desserts",
              ),
              Tab(
                text: "Beverages",
              ),
              Tab(
                text: "Sides",
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed("/cart");
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(),
                accountName:
                    Text(FirebaseAuth.instance.currentUser!.displayName ?? ""),
                accountEmail:
                    Text(FirebaseAuth.instance.currentUser!.email ?? ""),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile_default.jpeg"),
                  foregroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL ?? ""),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed("/profile");
                },
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed("/orderHistory");
                },
                title: Text(
                  "Orders history",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                onTap: () {
                  navigator!.pop();
                },
                title: Text(
                  "Payment",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                onTap: () {
                  navigator!.pop();
                },
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                onTap: () {
                  navigator!.pop();
                },
                title: Text(
                  "Customer support",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                onTap: () {
                  navigator!.pop();
                },
                title: Text(
                  "Rate Us",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                          size: 40,
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
                                      foregroundColor: Colors.red,
                                      iconSize: 30),
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
                ),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model[index].name ?? ''),
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, int index) => Divider(),
                    itemCount: model.length),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model[index].name ?? ''),
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, int index) => Divider(),
                    itemCount: model.length),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model[index].name ?? ''),
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, int index) => Divider(),
                    itemCount: model.length),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model[index].name ?? ''),
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, int index) => Divider(),
                    itemCount: model.length),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model[index].name ?? ''),
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, int index) => Divider(),
                    itemCount: model.length),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
