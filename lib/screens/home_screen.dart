import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/model/api_model.dart';
import 'package:food_delivery/services/api_services.dart';
import 'package:get/get.dart';

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
              DrawerHeader(
                child: Text(
                  "Food App",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
              ListTile(
                onTap: () {
                  navigator!.pop();
                },
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ListTile(
                onTap: () {
                  navigator!.pop();
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
                child: ElevatedButton(
                    onPressed: () => signout(),
                    child: Text(
                      "Sign out",
                      style: TextStyle(color: Colors.red),
                    )),
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
          Column(),
          Column(),
          Column(),
          Column(),
        ]),
      ),
    );
  }
}
