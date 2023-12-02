import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Shared/shared_preferences/shared_prefrences.dart';
import 'package:invoice_items/Core/Utils/Style/Colors.dart';
import 'package:invoice_items/Core/Utils/Style/TextStyle.dart';
import 'package:invoice_items/Core/Utils/app_sizes.dart';
import 'package:intl/intl.dart';
import 'package:invoice_items/Core/global.dart';
import 'package:invoice_items/Domain/cubit/add_invoice_cubit.dart';
import 'package:invoice_items/Presentaion/Widgets/TextFieldAndInput/dropDown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'HeaderRowItems.dart';
class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [ AppColor.teal.withOpacity(0.7),AppColor.teal,], // Add your gradient colors
          ),
          borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20)
          ,bottomRight:   Radius.circular(20)
        )
      ),
      child:  Padding(
        padding:  EdgeInsets.symmetric(vertical:AppSize.padding12(context)+15,horizontal: AppSize.padding4(context) ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          BlocConsumer<AddInvoiceCubit,AddInvoiceState>(
            listener: (BuildContext context, AddInvoiceState state) {  },
            builder: (BuildContext context,AddInvoiceState state) {
              return  Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    buildHeaderItem(title: 'رقم الفاتورة:', content: Text('#${CacheData.getData( key:CacheData.keyId) ?? 1 }', style: titleFont.copyWith(fontSize: 20,),)),
                    const Divider(),
                    const SizedBox(height:5,),
                    buildHeaderItem(title: 'العملة:', content:BuildDropDown(hintText: 'العملة', option:coins, controller: controlCoins,) ),
                    const Divider(),
                    const SizedBox(height: 10,),
                    buildHeaderItem(title: 'تاريخ الفاتورة:', content:Text(DateFormat.yMMMd().format(DateTime.now()), style: titleFont.copyWith(fontSize: 20,),) ,
                    )]
              );
            },
          )] ),
                       )
    );
  }
}
