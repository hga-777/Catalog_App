import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/homepage.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    //onpressed ka logic alg se likh diya
    //yeh asunc krna is necessary
    if(_formKey.currentState?.validate()??false){ // ?. (null-aware operator) tabhi value receive karega jb mera validate fuction null pass n karega 
    //?? (null-coalescing operator) iske help se agr iske aage ka expression null dega toh mera expression false ho jaega
    setState(() {
      // jab v screen change ho rha h toh set state call krna is necessary
      changedButton = true;
    });
    await Future.delayed(Duration(
        seconds: 1)); //make app wait for this duration before the next move
    await Navigator.pushNamed(context, MyRoute.homeRoute);
    setState(() {
      //taki jb dobara jae login screen pr toh mera button pahile jaisa rahe
      changedButton = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          //wrapping krne se agr screen ka size chota hoga toh scroll ho jaega
          child: Form(
            key: _formKey, //it helps to uniquely identify a form
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image.png", //to add image (downloaded from undraw)
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20.0,
                ), //ek blank space
                Text(
                  "Welcome $name !!",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
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
                        validator: (value) { //jb tk fill nhi hoga aage nhi jaega
                          if (value == null || value.isEmpty) {
                            return "Username cannot be empty!!";
                          }
                          return null;
                        },
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
                        validator: (value) {   //validator is added to taki mera button press krne pr sidhe aage n chala jae
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty!!";
                          } else if (value.length < 6) {
                            return "Password lenght should be atleast six"; 
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        color: const Color.fromARGB(255, 108, 100, 251), //material me hi color yeh sb add karo and decoration use n karo container me
                        borderRadius:
                            BorderRadius.circular(changedButton ? 50 : 6),
                        child: InkWell(
                          //isme conatiner ko wrap krne se mera hmlog usme onpressed waala logic add kr sakte hai
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            //this is added to make custom button
                            duration: const Duration(
                                seconds:
                                    1), //jb animated container use karoge toh duration dena is necessary
                            width: changedButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
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
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
