import 'package:flutter/material.dart';
import 'package:invoice_items/Core/global.dart';
import 'package:invoice_items/Domain/cubit/add_invoice_cubit.dart';

import '../../../Core/Shared/Components/components.dart';
//_validateAllRows:
bool validateAllRows({required AddInvoiceCubit cubit,required BuildContext context}) {
    print('controlCoins.text:${controlCoins.text.isEmpty}');
  if(cubit.tableData.isEmpty || controlCoins.text.isEmpty)
  {
    buildMessage(context: context, msg: 'برجاء ملء جميع الحقول');
    return false;
  }
    else{
      for (var data in cubit.tableData)
      {
  for (var controller in data.values) {
    print('data.value : ${controller.text}');
    if (controller.text.isEmpty  || controlCoins.text.isEmpty) {
      buildMessage(context: context, msg: 'برجاء ملء جميع الحقول');
      return false;
    } } }
return true;
    }

}

