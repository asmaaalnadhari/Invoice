import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Utils/Style/Colors.dart';
import 'package:invoice_items/Core/Utils/Style/TextStyle.dart';
import 'package:invoice_items/Core/Utils/app_sizes.dart';
import 'package:intl/intl.dart';

import 'HeaderRowItems.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width(context),
      height: AppSize.height(context) * 0.3,
      decoration: const BoxDecoration(
        color: AppColor.teal,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20)
          ,bottomRight:   Radius.circular(20)
        )
      ),
      child:  Padding(
        padding:  EdgeInsets.all(AppSize.padding2(context)),
        child: Column(
          children: [
            Text(
              'إدخال فاتورة',
              style: titleFont.copyWith(fontSize: 30,fontWeight: FontWeight.w800),
            ),
          Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildHeaderItem(title: 'رقم الفاتورة', content: '#735625'),
               const Divider(),
               const SizedBox(height:10,),
          buildHeaderItem(title: 'العملة', content: '#735625'),
          const Divider(),
          const SizedBox(height: 10,),
          buildHeaderItem(title: 'تاريخ الفاتورة', content: DateFormat.yMMMd().format(DateTime.now()),
          )]
            )] ),
                       )
    );
  }
}
