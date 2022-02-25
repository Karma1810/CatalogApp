// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:catalogapp2/models/cart.dart';
import 'package:catalogapp2/models/catalog.dart';
import 'package:catalogapp2/pages/buy_page.dart';
import 'package:catalogapp2/pages/cartpage.dart';
import 'package:catalogapp2/pages/homepage.dart';
import 'package:catalogapp2/pages/loginpage.dart';
import 'package:catalogapp2/utils/routes.dart';
import 'package:catalogapp2/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main() {
  CatalogModel catalog;
  CartModel cart;

  cart = CartModel();
  catalog = CatalogModel();
  runApp(VxState(store: MyStore(catalog, cart), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lighttheme(context),
      darkTheme: MyThemes.darktheme(context),
      initialRoute: Myroutes.loginroute,
      routes: {
        Myroutes.homeroute: (context) => HomePage(),
        Myroutes.loginroute: (context) => LoginPage(),
        Myroutes.cartroute: (context) => CartPage(),
        Myroutes.buyroute: (context) => BuyPage()
      },
    );
  }
}
