// ignore_for_file: unused_field

import 'package:catalogapp2/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  late CatalogModel _catalog;
  final List<int> _itemids = [];

  // ignore: unnecessary_getters_setters
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemids.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get total => items.fold(
      0, (previousValue, currrent) => previousValue + currrent.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemids.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemids.remove(item.id);
  }
}
