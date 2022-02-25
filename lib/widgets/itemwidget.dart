// ignore_for_file: prefer_const_constructors

import 'package:catalogapp2/models/catalog.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class itemWidget extends StatelessWidget {
  final Item item;

  const itemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
