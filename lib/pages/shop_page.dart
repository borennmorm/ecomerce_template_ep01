import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../components/my_product_tile.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          // shop title
          Center(
              child: Text(
            "Pick from a selected list of the premium products",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          )),
          // shop subtitle

          // product tile
          SizedBox(
            height: 550,
            child: ListView.builder(
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  // get each individual product from shop
                  final product = products[index];

                  // return as a product tile UI
                  return MyProductTile(product: product);
                }),
          ),
        ],
      ),
    );
  }
}
