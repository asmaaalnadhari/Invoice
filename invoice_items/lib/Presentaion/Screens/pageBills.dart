import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Shared/Components/components.dart';
import 'package:invoice_items/Core/Utils/Style/Colors.dart';
import 'package:invoice_items/Core/Utils/Style/TextStyle.dart';
import 'package:invoice_items/Core/Utils/app_sizes.dart';
import 'package:invoice_items/Domain/cubit/add_invoice_cubit.dart';
import 'package:invoice_items/Domain/cubit/getInvoiceData/get_invoice_cubit.dart';
import 'package:invoice_items/Presentaion/Screens/AddItemToInvoicePage.dart';
import '../Widgets/buildBils/FloatingAction.dart';
import '../Widgets/buildBils/buildSingleItems.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PageBills extends StatelessWidget {
  const PageBills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar:
      appBar: AppBar(
        title: Text(
          ' سجل الفواتير ', style: titleFont.copyWith(color: AppColor.white),),
        centerTitle: true,
        backgroundColor: AppColor.teal,
      ),
      ///body:
      body: BlocBuilder<GetInvoiceCubit, GetInvoiceState>(
        builder: (context, state) {
          if (state is GetAllInvoiceLoading) {
            return const LoadingWidget();
          }
          if (state is GetAllInvoiceSuccess) {
            return state.invoiceData.isNotEmpty ?
            Padding(
              padding: EdgeInsets.all(AppSize.padding2(context)),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return billWidget(
                      context: context, invoiceData: state.invoiceData[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10,);
                },
                itemCount: state.invoiceData.length,
              ),
            ) :
            Center(
              child: Container(
                alignment: Alignment.center,
                height: AppSize.height(context) / 12,
                width: AppSize.width(context) / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.teal
                ),
                child: const Text('لم تقم بإضافة أي فاتورة..',
                  style: TextStyle(color: AppColor.white),),
              ),
            );
          }
          return Container();
        },


      ),
      ///floatingActionButton:
      floatingActionButton:floatingActionButton(onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => const AddItems()),
                   );
          }
          ));
  }
}
