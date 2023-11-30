import 'package:flutter/material.dart';
import 'package:invoice_items/Domain/cubit/add_invoice_cubit.dart';

import '../../../Core/Utils/Style/Colors.dart';
import '../../../Core/Utils/Style/TextStyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buidDataRow.dart';

///02#build Table:
Widget buildTable({required BuildContext context,required AddInvoiceCubit cubit}) {
  return DataTable(
    border:  TableBorder.all(
        width: 2,
        color: AppColor.gray
    ),
    headingRowColor: MaterialStateColor.resolveWith((states) =>AppColor.teal), // Header color
    dividerThickness: 0.0,
    columns:  [
      DataColumn(label: Text('اسم الصنف',style: titleFont,),),
      DataColumn(label: Text('الوحدة',style: titleFont)),
      DataColumn(label: Text('الكمية',style: titleFont)),
      DataColumn(label: Text('السعر',style: titleFont)),
      DataColumn(label: Text('القيمة',style: titleFont)),
      DataColumn(label: Text('حذف',style: titleFont)),
    ],
    rows: cubit.tableData.map((data) => buildDataRow(data, cubit: cubit)).toList(),
  );
}
