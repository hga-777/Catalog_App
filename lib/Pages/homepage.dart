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
    try {
      final catalogJson =
          await rootBundle.loadString("assets/files/catalog.json");
      final decodedData = jsonDecode(catalogJson);
      var productData = decodedData["products"];
      CatalogModel.items = List.from(productData)
          .map<Items>((items) => Items.fromMap(items))
          .toList();
      setState(() {});
    } catch (error) {
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
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,//this will give 2 elements in a row
                    mainAxisSpacing: 18,//vertical spacing
                    crossAxisSpacing: 18),  //horizonatal spacing
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias, //for smooth edges for the clipped content
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(padding: EdgeInsets.all(12),child: Text(item.name , style: TextStyle(color: Colors.white),), 
                      decoration: const BoxDecoration(color:  Color.fromARGB(255, 108, 100, 251),),),
                      footer: Container(padding: EdgeInsets.all(12),child: Text(item.price.toString() , style: TextStyle(color: Colors.white),), 
                      decoration: const BoxDecoration(color:  Color.fromARGB(255, 108, 100, 251),),),
                      child: Image.network(item.image),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
