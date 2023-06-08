import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'Pages/cart_page.dart';
import 'Pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart'; //added to use google fonts (pub.dev)
import 'widgets/theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false, //yeh krne se side me jo debug likha h woh gayab ho jaega
      initialRoute: "/home", //intial strting page
      routes: {
        //yeh rasta batata h ki is page ke baad kon sa page jaega
        "/": (context) => LoginPage(), //yeh starting address
        MyRoute.homeRoute: (context) => HomePage(),
        MyRoute.loginRoute: (context) => LoginPage(),
        MyRoute.cartRoute: (context) => CartPage(),
        // "/login" : (context) => Login_Page(),
      },
    );
  }
}
