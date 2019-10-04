// import 'package:LFS/widget/HomeWidgets/Category.dart';
// import 'package:LFS/widget/atoms/FancyText.dart';
// import 'package:flutter/material.dart';

// // import 'package:provider/provider.dart';

// class ProductGrid extends StatelessWidget {
//   final image;
//   final name;
//   final id;
//   final address;
//   final contact;
//   ProductGrid({this.image, this.name, this.address, this.contact,this.id,});
  
//   @override
//   Widget build(BuildContext context) {
//     // final product = Provider.of<ProductModel>(context);    
//       return GridView.builder(
//         itemCount: 10,//merchants.length,
//         scrollDirection: Axis.vertical,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           childAspectRatio: 0.84,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//             // final products = product.products;
//             return products.length > 0
//                 ? Category(
// //                             name: merchants[index]['name'],
// //                             id: merchants[index]['_id'],
// //                             width: screenWidth,
// //                             height: 150.0,
// // address: merchants[index]['address'],

// //                             network: merchants[index]['media'] != null
// //                                 ? merchants[index]['media']['src'][0]
// //                                 : null,
// //                           ),
// //                         );
//                 : FancyText(
//                     text: 'Products are being loaded...',
//                     size: 12.0,
//                   );
//           },
//       );
//     }
//   }

