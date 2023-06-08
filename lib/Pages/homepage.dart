import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widgets.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'dart:convert'; //it gives json decoder encoder
import "package:velocity_x/velocity_x.dart";

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

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
      backgroundColor: MyTheme.creamColor,
        body: SafeArea(
      //yeh uper me battery and niche me jo mobile ka rehta h
      child: Container(
        padding: Vx.m32, //saare trf se 32 ka padding kr dega
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  //isse mera jo v text aana h woh left se start hoga
          children: [
             catalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                    CircularProgressIndicator().centered().py16().expand(),             
          ],
        ),
      ),
    ));
  }
}





