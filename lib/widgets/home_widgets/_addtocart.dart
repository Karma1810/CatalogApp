// ignore_for_file: prefer_const_constructors

import 'package:catalogapp2/core/store.dart';
import 'package:catalogapp2/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(context.backgroundColor),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isInCart
          ? Icon(Icons.done)
          : "Add To Cart".text.color(context.cardColor).make(),
    );
  }
}
