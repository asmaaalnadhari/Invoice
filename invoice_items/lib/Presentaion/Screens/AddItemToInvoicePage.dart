import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Utils/Style/TextStyle.dart';
import 'package:invoice_items/Core/Utils/app_sizes.dart';

import '../Widgets/AddItemToInvoicePage/EditTable.dart';
import '../Widgets/AddItemToInvoicePage/HeaderPage.dart';
class AddItems extends StatelessWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderPage(),
              Padding(
                padding:  EdgeInsets.all(AppSize.padding2(context)),
                child: Text(
                  'اضف أصناف',
                  style: titleFont,
                ),
              ),
              const EditableTable()
            ],
          ),
        ),
      ),
    );
  }
}
