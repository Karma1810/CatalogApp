// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, avoid_print, prefer_const_literals_to_create_immutables

import 'package:catalogapp2/core/store.dart';
import 'package:catalogapp2/models/cart.dart';
import 'package:catalogapp2/models/catalog.dart';
import 'package:catalogapp2/utils/routes.dart';
import 'package:catalogapp2/widgets/drawer.dart';
import 'package:catalogapp2/widgets/home_widgets/catalog_header.dart';
//import 'package:catalogapp2/widgets/themes.dart';
//import 'package:catalogapp2/widgets/Itemwidget.dart';
//import 'package:catalogapp2/widgets/drawer.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/621873ff25fb1b26b1889bb0";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      // appBar: AppBar(
      //backgroundColor: Colors.transparent,
      //  ),
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) =>
            FloatingActionButton(
          onPressed: (() => Navigator.pushNamed(context, Myroutes.cartroute)),
          backgroundColor: context.backgroundColor,
          child: Icon(Icons.add_shopping_cart_rounded),
        ).badge(
                color: Vx.green300,
                size: 20,
                count: _cart.items.length,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.lato().fontFamily)),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Catalogheader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py8().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
