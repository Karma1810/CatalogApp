import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.primaryColor).make(),
        "Trending products".text.xl2.make().py(4)
      ],
    );
  }
}
