// import 'package:LFS/widget/HomeWidgets/Category.dart';
// import 'package:LFS/widget/HomeWidgets/constantsCat.dart';
// import 'package:flutter/material.dart';

// class AsymmetricView extends StatelessWidget {

//   const AsymmetricView({Key key});
  
//   List<Widget> _buildColumns(BuildContext context){
//    return List.generate(_listItemCount(products.length),(int index){
//      double width = .59 * MediaQuery.of(context).size.width;
//      Widget column;
//      if (index %2 == 0){
//        int bottom = _evenCasesIndex(index);
//        column = TwoProductCardColumn(column);
//      }
//    });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       padding: EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
//       children: _buildColumns(context),
//     );
//   }
// }