import 'package:flutter/material.dart';

import '../../../Core/Utils/Style/TextStyle.dart';
import '../../../Core/Utils/app_sizes.dart';
import '../../../Core/global.dart';

Widget buildTotals({
  required  BuildContext context
}) {
  return Container(
    padding: EdgeInsets.all(AppSize.padding2(context)),
    child:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الإجمالي :', style: bodyFont,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppSize.padding20(context)),
          child: Text('-', style: bodyFont,),
        ),
        Padding(
          padding: EdgeInsets.only(right: AppSize.padding20(context)-10),
          child: Text(totalQuantity.toString(), style: bodyFont),
        ),
        Padding(
          padding: EdgeInsets.only(right: AppSize.padding20(context)-9),
          child: Text(totalPrice.toString(), style: bodyFont),
        ),
        Padding(
          padding: EdgeInsets.only(right: AppSize.padding20(context)-10),
          child: Text(totalValue.toString(), style: bodyFont,),
        ),
      ],
    ),

  );
}