import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_items/Data/Model/InvoicesModel/InvoiceData.dart';
import 'package:invoice_items/Domain/cubit/getInvoiceData/get_invoice_cubit.dart';
import '../../../../Core/Utils/Style/Colors.dart';
import '../../../../Core/Utils/Style/TextStyle.dart';
import '../../../../Core/Utils/app_sizes.dart';
import '../../AddItemToInvoicePage/HeaderRowItems.dart';

class HeaderBillDetails extends StatelessWidget {
  const HeaderBillDetails({Key? key, required this.invoiceModel}) : super(key: key);
  final InvoiceData invoiceModel;
  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: const BoxDecoration(
            color: AppColor.teal,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20)
                ,bottomRight:   Radius.circular(20)
            )
        ),
        child:  Padding(
          padding:  EdgeInsets.symmetric(vertical:AppSize.padding12(context)+15,horizontal: AppSize.padding4(context) ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      buildHeaderItem(title: 'رقم الفاتورة', content: Text('#${invoiceModel.invoiceNumber}', style: titleFont.copyWith(fontSize: 20,),)),
                      const Divider(),
                      const SizedBox(height:5,),
                      buildHeaderItem(title: 'العملة', content:Text('(${invoiceModel.coins})', style: titleFont.copyWith(fontSize: 20,),) ),
                      const Divider(),
                      const SizedBox(height: 10,),
                      buildHeaderItem(title: 'تاريخ الفاتورة', content:Text('(${invoiceModel.invoiceDate})', style: titleFont.copyWith(fontSize: 20,),), ),
                      const Divider(),
                      const SizedBox(height: 10,),
                      buildHeaderItem(title: 'عدد الأصناف:   ', content:Text('(${BlocProvider.of<GetInvoiceCubit>(context).itemCounts})', style: titleFont.copyWith(fontSize: 20,),), ),
                      const Divider(),
                      const SizedBox(height: 10,),
                      buildHeaderItem(title: 'الإجمالي:   ', content:Text('(${invoiceModel.total})${invoiceModel.coins}', style: titleFont.copyWith(fontSize: 20,),), )
                    ]
                )] ),
        )
    );

  }
}
