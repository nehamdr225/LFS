import 'package:LFS/widget/HomeWidgets/Category.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/OfferCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LFS/state/merchants.dart';

class ProductsPage extends StatelessWidget {
  final offerCard;
  final type;
  ProductsPage({this.type: "Hotel", this.offerCard: false});
  @override
  Widget build(BuildContext context) {
    final merchants = Provider.of<MerchantsModel>(context).category(type);
    //var products = product.products;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppbar(
            leadingChoice: false,
          ),
        ),
        body: offerCard == false
            ? Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.84,
                  ),
                  itemCount: merchants.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 2.0,
                      shape: Border.all(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.grey[200]),
                      child: Category(
                        name: merchants[index]['name'],
                        id: merchants[index]['_id'],
                        width: 150.0,
                        height: 80.0,
                        network: merchants[index]['media'] != null
                            ? merchants[index]['media']['src'][0]
                            : null,
                      ),
                    );
                  },
                ),
              )
            : Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.8,
                    mainAxisSpacing: 20.0
                  ),
                  itemCount: merchants.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OfferCard(
                      padding: 0.0,
                      image: merchants[index]['media'] != null
                          ? merchants[index]['media']['src'][0]
                          : null,
                      name: merchants[index]['name'],
                      id: merchants[index]['_id'],
                      address: merchants[index]['address'],
                      contact: merchants[index]['contact'],
                    );
                  },
                ),
              ));
  }
}
