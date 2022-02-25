// ignore_for_file: prefer_const_constructors

import 'package:catalogapp2/widgets/home_widgets/_addtocart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalogapp2/models/catalog.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;
  const HomeDetails({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: context.primaryColor),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.only(right: 16.0),
          children: [
            "\$${catalog.price}"
                .text
                .bold
                .xl2
                .color(context.primaryColor)
                .make(),
            AddToCart(catalog: catalog).w32(context).h(40.0)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 25.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl3
                          .color(context.primaryColor)
                          .make(),
                      catalog.desc.text
                          .maxFontSize(16)
                          .color(context.primaryColor)
                          .make(),
                      // "Sea vero diam labore labore at ipsum est voluptua amet at, clita duo accusam dolore sit lorem. Amet est clita ut lorem eos. Invidunt et magna sanctus est. Gubergren takimata sed at sea et dolores diam aliquyam kasd. Rebum sea lorem et et magna amet et tempor. Duo at sea"
                      //  .text
                      // .maxFontSize(12)
                      // .color(context.primaryColor)
                      //.make()
                      //.px20()
                      // .py16(),
                      catalog.info.text
                          .maxFontSize(12)
                          .color(context.primaryColor)
                          .make()
                          .py16()
                          .px8()
                    ],
                  ).py(64.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
