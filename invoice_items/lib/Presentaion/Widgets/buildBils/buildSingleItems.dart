import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoice_items/Core/Utils/app_sizes.dart';
import 'package:invoice_items/Data/Model/InvoicesModel/InvoiceData.dart';
import '../../../Core/Utils/Style/Colors.dart';

Widget billWidget({required BuildContext context,required InvoiceData invoiceData})
{
  return InkWell(
    onTap: () => Navigator.pushNamed(context, '/BillDetailsPage'),
    child: Container(
      padding:  EdgeInsets.all(AppSize.padding2(context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColor.gray,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset('assets/images/bill.svg', width: 70, height: 70,),
              ),
              const SizedBox(width: 10,),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('رقم الفاتورة : ${invoiceData.invoiceNumber}'),
                  Text('العملة : ${invoiceData.coins}'),
                  Text('المبلغ : ${invoiceData.total}'),
                ],
              ),
              const Spacer(),
               Text(invoiceData.invoiceDate, style: const TextStyle(fontSize: 12, color: Colors.black45,),),
            ],
          ),
        ],
      ),
    ),
  );
}