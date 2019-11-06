import 'package:LFS/widget/HomeWidgets/Category.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/BottomLoader.dart';
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
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppbar(
            leadingChoice: false,
            title: offerCard == false ? "$type Merchants" : "$type Offers",
          ),
        ),
        body: offerCard == false
            ? Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: merchants.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index == merchants.length
                        ? BottomLoader()
                        : Card(
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
                      childAspectRatio: 1.9,
                      mainAxisSpacing: 2.0),
                  itemCount: merchants.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index == merchants.length
                        ? BottomLoader()
                        : OfferCard(
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
