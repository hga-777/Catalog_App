import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'Pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart'; //added to use google fonts (pub.dev)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
MaterialColor customPurpleColor = MaterialColor(0xFF6C64FB, {   //this is added to make custom color (chatgpt)
  50: Color(0xFFE8E7FC),
  100: Color(0xFFC5C3F8),
  200: Color(0xFFA09DF5),
  300: Color(0xFF7C79F2),
  400: Color(0xFF5956EE),
  500: Color(0xFF6C64FB), // The primary shade
  600: Color(0xFF322EE9),
  700: Color(0xFF2C27C3),
  800: Color(0xFF251F9D),
  900: Color(0xFF1F1880),
});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:   customPurpleColor, //primary Swatch is the color of appbar , button etc
        fontFamily: GoogleFonts.roboto()
            .fontFamily, // yeha change krne se saare jagah chnage ho jaega
      ),
      darkTheme: ThemeData(
        //dark theme property when the dark mode is on
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false, //yeh krne se side me jo debug likha h woh gayab ho jaega
      initialRoute: "/home", //intial strting page
      routes: {
        //yeh rasta batata h ki is page ke baad kon sa page jaega
        "/": (context) => LoginPage(), //yeh starting address
        MyRoute.homeRoute: (context) => HomePage(),
        MyRoute.loginRoute: (context) => LoginPage(),
        // "/login" : (context) => Login_Page(),
      },
    );
  }
}
