import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../theme.dart';

class AddToCart extends StatelessWidget {
  final Items catalog;
  AddToCart({
    super.key,
    required this.catalog,
  });

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();
          // _cart.add(catalog);
          // _cart.catalog = _catalog;
          // setState(() {});
          AddMutation(catalog);
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
