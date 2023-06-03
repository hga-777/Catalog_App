import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/login_page.dart';
import 'Pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ), //primary Swatch is the color of appbar , button etc
      darkTheme: ThemeData(
        //dark theme property when the dark mode is on
        brightness: Brightness.dark,
      ),
      initialRoute: "/home", //intial strting page
      routes: {
        //yeh rasta batata h ki is page ke baad kon sa page jaega
        "/": (context) => LoginPage(), //yeh starting address
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        // "/login" : (context) => Login_Page(),
      },
    );
  }
}
