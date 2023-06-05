import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widgets.dart';
import 'package:flutter_catalog/models/catalog.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]); //this will create a dummy list of a particular item
    return Scaffold(
      //yeh widget hai jo ki mera head , body ,fotter ko contain krta hai
      appBar: AppBar(
        title: Text('Catalog App'),
      ), //it acts like a head of the widget
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          //its like recycler view in which one can see things at once and other things after scrolling
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidgets(
              items: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
