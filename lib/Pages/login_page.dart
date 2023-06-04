import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png", //to add image (downloaded from undraw)
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ), //ek blank space
            const Text(
              "Welcome!!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                //column is wrapped with padding
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      //isko column me wrapped kiye
                      hintText:
                          "Enter Username", //yeh tb dikhega jb mera user us field ko click kr dega
                      labelText: "Username", //yeh waise hi dikhte rahega
                    ),
                  ),
                  TextFormField(
                    obscureText:
                        true, //this will make the texts in this field as doted
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Pasword",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () => print('Ha'),
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
