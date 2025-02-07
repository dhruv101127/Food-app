import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/cart.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/screens/login.dart';
import 'package:food_delivery/screens/register.dart';
import 'package:food_delivery/screens/wrapper.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Wrapper()),
        GetPage(name: "/login", page: () => LoginSignup()),
        GetPage(name: "/signup", page: () => RegisterUser()),
        GetPage(name: "/homescreen", page: () => HomeScreen()),
        GetPage(name: "/cart", page: () => Cart()),
      ],
      // home: Wrapper(),
    );
  }
}
