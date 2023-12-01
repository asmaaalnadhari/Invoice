import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice_items/Core/Shared/Components/components.dart';
import 'package:invoice_items/Data/Model/InvoicesModel/InvoiceData.dart';
import 'package:invoice_items/Domain/cubit/getInvoiceData/get_invoice_cubit.dart';
import 'package:invoice_items/Presentaion/Widgets/buildBils/PageBuildDetails/HeaderPageDetails.dart';
import '../../Core/Utils/Style/TextStyle.dart';
import '../../Core/Utils/app_sizes.dart';
import '../Widgets/buildBils/PageBuildDetails/buildItemsTable.dart';

class PageBillDetails extends StatelessWidget {
  const PageBillDetails({Key? key, required this.invoiceData})
      : super(key: key);
  final InvoiceData invoiceData;

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
          ),

          title: Text(
            'بيانات الفاتورة',
            style: titleFont.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<GetInvoiceCubit, GetInvoiceState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if(state is GetAllItemsOfInvoiceLoading)
                {
                  return const LoadingWidget();
                }
              if(state is GetAllItemsOfInvoiceSuccess)
              {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderBillDetails(invoiceModel: invoiceData),
                    Padding(
                      padding: EdgeInsets.all(AppSize.padding2(context)),
                      child: Text(
                        'أصناف الفاتورة ',
                        style: titleFont,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                        child: buildItemsTable(context: context, itemsTable: state.itemsData)),
                  ],
                );
              }

              return const Center();
            },
          ),
        ),

      ),
    );
  }

}
