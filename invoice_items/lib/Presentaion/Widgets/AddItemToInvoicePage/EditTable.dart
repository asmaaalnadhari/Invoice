import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice_items/Core/Utils/Style/Colors.dart';
import 'package:invoice_items/Core/global.dart';
import 'package:invoice_items/Data/Model/InvoicesModel/InvoiceData.dart';
import 'package:invoice_items/Domain/cubit/add_invoice_cubit.dart';
import '../../../Core/Shared/Components/components.dart';
import '../TableItems/buildTable.dart';
import '../TextFieldAndInput/ValidateInput.dart';
import '../TextFieldAndInput/buildTotals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//------------------------------------------------------------
class EditableTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddInvoiceCubit, AddInvoiceState>(
  listener: (context, state) {
    if(state is AddInvoiceSuccess)
      {
        buildMessage(context: context, msg: 'تم الحفظ بنجاح');
      }
    else if(state is AddInvoiceLoading)
    {
      const LoadingWidget();
    }
  },
  builder: (context, state) {
    AddInvoiceCubit cubit =BlocProvider.of<AddInvoiceCubit>(context);
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: buildTable(context: context, cubit: cubit),
        ),
        const Divider(thickness: 1,color: AppColor.black,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:buildTotals(
                context: context)
        ),
        const Divider(thickness: 1,color: AppColor.black,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton(onTap: () {cubit.addRow();  }, label: 'اضف صنف', icon: Icons.add, context: context),
            buildButton(
                onTap: () {
                  bool istrue=validateAllRows( context: context, cubit: cubit);
                if (istrue)
                {
                  cubit.addInvoice(invoiceData: InvoiceData(invoiceNumber: invoiceNumber, invoiceDate:DateFormat.yMMMd().format(DateTime.now()).toString(), coins: controlCoins.text, total: totalValue,), items: []);
                }}, label: ' حفظ الأصناف', icon: Icons.save_alt, context: context),
          ],
        ),
      ],
    );
  },
);
  }
}