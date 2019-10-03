import 'package:LFS/widget/HomeWidgets/Category.dart';
import 'package:LFS/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final Orientation orientation;
  final List products;
  final int count;
  ProductGrid({this.orientation, this.products, this.count});
  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<ProductModel>(context);    
      return GridView.builder(
        itemCount: count,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          childAspectRatio: 0.84,
        ),
        itemBuilder: (BuildContext context, int index) {
            // final products = product.products;
            return products.length > 0
                ? Category(
                    name: products[index]['name'],
                    src: products[index]['media'][0]['src'].length > 0
                        ? products[index]['media'][0]['src'][0]
                        : null,
                    height: 130.0,
                    caption: products[index]['price'],
                    
                    // details: products[index]['details'],
                    id: products[index]['_id'])
                : FancyText(
                    text: 'Products are being loaded...',
                    size: 12.0,
                  );
          },
      );
    }
  }

