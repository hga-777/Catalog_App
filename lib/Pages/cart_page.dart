import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: Text("Cart"),
      ),
      body: Column(children: [
        _CartList()
            .p32()
            .expand(), //placeholder ek widget h jo ki bta rha ek space liya gya h and expand krne se saara available space le rakha h
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //yeh krne se hmlog height ,width aaram se add kr sakte h
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxConsumer(
          notifications: {},
          mutations: {RemoveMutation},
          builder: (context, dynamic _, __) {
            return "\$${_cart.totalPrice}"
                .text
                .xl5
                .color(Theme.of(context).colorScheme.secondary)
                .make();
          },
        ),
        30.widthBox,
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: "Buying not supported yet.".text.make(),
            ));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
          ),
          child: "Buy".text.white.make(),
        ).w32(context),
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    ;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  // _cart.remove(_cart.items[index]);
                  // setState(() {});
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
