import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_items/Core/Utils/Style/TextStyle.dart';
import 'package:invoice_items/Core/Utils/app_sizes.dart';
import 'package:invoice_items/Domain/cubit/getInvoiceData/get_invoice_cubit.dart';
import '../Widgets/AddItemToInvoicePage/EditTable.dart';
import '../Widgets/AddItemToInvoicePage/HeaderPage.dart';

class AddItems extends StatelessWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading:  BackButton(
            onPressed:(){
              Navigator.pop(context);
              BlocProvider.of<GetInvoiceCubit>(context).getAllInvoices();

            } ,
          )
,
          title:Text(
            'إدخال فاتورة',
            style: titleFont.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderPage(),
              Padding(
                padding: EdgeInsets.all(AppSize.padding2(context)),
                child: Text(
                  'اضف أصناف',
                  style: titleFont,
                ),
              ),
               EditableTable()
            ],
          ),
        ),
      ),
    );
  }
}
