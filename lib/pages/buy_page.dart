// ignore_for_file: prefer_const_constructors

import 'package:catalogapp2/widgets/home_widgets/_addtocart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.check_mark_circled_solid),
          "Purchase Successful"
              .text
              .xl4
              .color(context.primaryColor)
              .makeCentered(),
        ],
      ),
    );
  }
}
