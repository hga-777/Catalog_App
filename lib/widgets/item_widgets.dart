import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidgets extends StatelessWidget {
  final Items items;

  const ItemWidgets({Key? key, required this.items})
      : assert(items != null), //this will check whether my item is null or not
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          debugPrint("${items.name} pressed");
        },
        leading: Container(
      width: 50, // Adjust the width according to your needs
      child: Image.network(items.image),
    ),
        title: Text(items.name),
        subtitle: Text(items.desc),
        trailing: Text("₹${items.price}"
        ,textScaleFactor: 1.5,
        style: const TextStyle(
          color:  Color.fromARGB(255, 108, 100, 251) ,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}
