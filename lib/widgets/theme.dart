import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

MaterialColor customPurpleColor = MaterialColor(0xFF6C64FB, {
  //this is added to make custom color (chatgpt)
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

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch:
            customPurpleColor, //primary Swatch is the color of appbar , button etc
        fontFamily: GoogleFonts.roboto()
            .fontFamily, // yeha change krne se saare jagah chnage ho jaega
        cardColor: Colors.white,
        canvasColor: creamColor,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: darkBluish,
          // Additional button styles can be customized here
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
        fontFamily: GoogleFonts.roboto().fontFamily,
        cardColor: Colors.black,
        canvasColor: gray,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        ), //works when working in dark mode
        buttonTheme: ButtonThemeData(
          buttonColor: lightBluish,
          // Additional button styles can be customized here
        ),
      );
// colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluish = Color.fromARGB(255, 20, 23, 199);
  static Color gray = Vx.gray900;
  static Color lightBluish = Vx.blue300;
}
