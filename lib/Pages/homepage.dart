import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widgets.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; //it gives json decoder encoder

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //it is a lifecycle method typically use for initialising things
    super.initState();
    loadData();
  }

  loadData() async {
    //to retrive data from the json
    await Future.delayed(Duration(seconds: 2));
    try{
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items = List.from(productData)
        .map<Items>((items) => Items.fromMap(items))
        .toList();
    setState(() {});
    } catch(error){
      debugPrint("Error loading catalog data: $error");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //yeh widget hai jo ki mera head , body ,fotter ko contain krta hai
      appBar: AppBar(
        title: Text('Catalog App'),
      ), //it acts like a head of the widget
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                //its like recycler view in which one can see things at once and other things after scrolling
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidgets(
                    items: CatalogModel.items[index],
                  );
                },
              )
            : CircularProgressIndicator(), 
      ),
      drawer: MyDrawer(),
    );
  }
}
