import 'package:flutter/material.dart';
import '../../../../Core/Utils/Style/Colors.dart';
import '../../../../Core/Utils/Style/TextStyle.dart';
import '../../../../Data/Model/ItemsModel/ItemData.dart';
import 'buildDataRowItems.dart';

Widget buildItemsTable({required BuildContext context,required List<ItemData> itemsTable})
{
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
    rows: itemsTable.map((data) => buildDataRowItems(itemModel: data)).toList(),
  );
}
