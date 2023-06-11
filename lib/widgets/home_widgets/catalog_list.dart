import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Pages/home_details.dart';
import '../../models/catalog.dart';
import '../theme.dart';
import 'catalog_images.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
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
    return VxBox(
      //its like container
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
                alignment: MainAxisAlignment
                    .spaceBetween, //jitna space h usme aapne aap ko divide kr lo
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  _AddToCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  } //py se padding y direction me , rounded se jo continer h uska edge round ho gya
}

class _AddToCart extends StatefulWidget {
  final Items catalog;
  const _AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.add(widget.catalog);
        _cart.catalog = _catalog;
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkBluish,
          ),
          shape: MaterialStateProperty.all(
            //aa lgane ka mtlb agr press kro ya n karo
            StadiumBorder(),
          )),
      child: isAdded ? Icon(Icons.done) : "Track".text.make(),
    );
  }
}
