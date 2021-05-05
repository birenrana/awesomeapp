import 'package:awesomeapp/pages/home_page.dart';
import 'package:awesomeapp/pages/login_page.dart';
import 'package:awesomeapp/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    title: "Awesome App",
    debugShowCheckedModeBanner: false,
    home:
        Constants.prefs.getBool("loggedIn") == true ? Homepage() : LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    routes: {
      "/login": (context) => LoginPage(),
      "/home": (context) => Homepage(),
    },
  ));
}
