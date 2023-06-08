import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class catalogHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,  //isse mera jo v text aana h woh left se start hoga
          children: [
            "Catalog App"
                .text
                .xl5
                .bold
                // .color(MyTheme.darkBluish)
                .make(), //yeh saara velocity_x waale se ho rha h
            //isme . lga kr properties daal sakte hai
            "Trending products".text.make(),
          ],
        );
  }
}