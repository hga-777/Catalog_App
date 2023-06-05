import 'package:flutter/material.dart';

class CatalogModel {
  static final items = [
    Items(
        id: '1',
        name: "Kurkure",
        desc: "A great snack ",
        price: 20,
        Color: "#FF6C64FB",
        image:
            "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YXBwJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60")
  ];
}

class Items {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String Color;
  final String image;

  Items(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.Color,
      required this.image});
}
