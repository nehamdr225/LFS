import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/ProductGrid.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<ProductModel>(context);
    //var products = product.products;
    return Scaffold(
        backgroundColor: Colors.grey[200],
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppbar(
          leadingChoice: false,
        ),
      ),
        body: OrientationBuilder(builder: (context, orientation) {
          return ProductGrid(
              orientation: orientation,
              // products: products,
              // count: product.count
          );
        }
        ));
  }
}
