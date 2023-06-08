import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widgets.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'dart:convert'; //it gives json decoder encoder
import "package:velocity_x/velocity_x.dart";

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
                  const Center(
                    child: CircularProgressIndicator(),             
                  )
          ],
        ),
      ),
    ));
  }
}

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
                .color(MyTheme.darkBluish)
                .make(), //yeh saara velocity_x waale se ho rha h
            //isme . lga kr properties daal sakte hai
            "Trending products".text.make(),
          ],
        );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}


class CatalogItem extends StatelessWidget {
  final Items catalog;

  const CatalogItem({Key? key = const Key('default'), required this.catalog})
      : assert(catalog != null),
        super(key: key);

    @override
  Widget build(BuildContext context) {
    return VxBox(  //its like container
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluish).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween, //jitna space h usme aapne aap ko divide kr lo
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluish,
                        ),
                        shape: MaterialStateProperty.all(  //aa lgane ka mtlb agr press kro ya n karo
                          StadiumBorder(),
                        )),
                    child: "Compare".text.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  } //py se padding y direction me , rounded se jo continer h uska edge round ho gya
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key = const Key('default'), required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}