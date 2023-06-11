import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../theme.dart';

class AddToCart extends StatefulWidget {
  final Items catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
        isInCart = isInCart.toggle();
        final _catalog = CatalogModel();
        _cart.add(widget.catalog);
        _cart.catalog = _catalog;
        setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkBluish,
          ),
          shape: MaterialStateProperty.all(
            //aa lgane ka mtlb agr press kro ya n karo
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(Icons.cyclone),
    );
  }
}