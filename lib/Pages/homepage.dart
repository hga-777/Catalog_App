import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(  //yeh widget hai jo ki mera head , body ,fotter ko contain krta hai 
      appBar: AppBar(title: Text('Catalog App'),), //it acts like a head of the widget
          body: Center( 
              child: Container(
                   child: Text('Welcome!!'),
      )));
  }
}