import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/homepage.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          //wrapping krne se agr screen ka size chota hoga toh scroll ho jaega
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png", //to add image (downloaded from undraw)
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ), //ek blank space
              Text(
                "Welcome $name !!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
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
                      onChanged: (value) {
                        //yeh krne se jo welcome likha h usme username add ho jaega
                        name = value;
                        setState(
                            () {}); //yeh build method ko dobara se call krta hai
                      },
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

                    InkWell(
                      //isme conatiner ko wrap krne se mera hmlog usme onpressed waala logic add kr sakte hai
                      onTap: () async { //yeh asunc krna is necessary
                        setState(() {
                          // jab v screen change ho rha h toh set state call krna is necessary
                          changedButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));  //make app wait for this duration before the next move
                        Navigator.pushNamed(context, MyRoute.homeRoute);
                      },
                      child: AnimatedContainer(
                        //this is added to make custom button
                        duration: const Duration(
                            seconds:
                                1), //jb animated container use karoge toh duration dena is necessary
                        width: changedButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changedButton ? 50 : 6),
                        ),
                        child: changedButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      ),
                    )

                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //         context,
                    //         MyRoute
                    //             .homeRoute); //this is the class use for navigation
                    //   },
                    //   style: TextButton.styleFrom(minimumSize: Size(120, 40)),
                    //   child: Text("Login"),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
