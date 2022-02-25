// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:catalogapp2/pages/home_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

import '_addtocart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetails(
                          catalog: catalog,
                        ))),
            child: CatalogItems(catalog: catalog));
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItems extends StatelessWidget {
  final Item catalog;
  const CatalogItems({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(context.primaryColor).make(),
              catalog.desc.text
                  .maxFontSize(12)
                  .color(context.primaryColor)
                  .make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.only(right: 14.3),
                children: [
                  "\$${catalog.price}"
                      .text
                      .bold
                      .xl
                      .color(context.primaryColor)
                      .make(),
                  AddToCart(catalog: catalog)
                ],
              ),
            ],
          ))
        ],
      ),
    ).color(context.cardColor).square(150).rounded.make().py(16);
  }
}
