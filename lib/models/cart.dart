import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
// static final cartModel  = CartModel._internal();    //singleton banaya
// CartModel._internal();
// factory CartModel()=> cartModel;


  // catalog field
  CatalogModel _catalog = CatalogModel();   //late CatalogModel _catalog;



  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
List<Items> get items =>
    _itemIds.map((id) => CatalogModel.getByID(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(Items item) {
    _itemIds.add(item.id.toInt());
  }

  // Remove Item

  void remove(Items item) {
    _itemIds.remove(item.id);
  }
}