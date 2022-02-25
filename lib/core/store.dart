import 'package:velocity_x/velocity_x.dart';

import 'package:catalogapp2/models/cart.dart';
import 'package:catalogapp2/models/catalog.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  MyStore(
    this.catalog,
    this.cart,
  ) {
    cart.catalog = catalog;
  }
}
