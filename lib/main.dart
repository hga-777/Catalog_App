import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/login_page.dart';
import 'Pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart'; //added to use google fonts (pub.dev)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple, //primary Swatch is the color of appbar , button etc
        fontFamily: GoogleFonts.roboto()
            .fontFamily, // yeha change krne se saare jagah chnage ho jaega
      ),
      darkTheme: ThemeData(
        //dark theme property when the dark mode is on
        brightness: Brightness.dark,
      ),
      initialRoute: "/login", //intial strting page
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
