import 'package:flutter/material.dart';
import 'package:invoice_items/Data/Model/ItemsModel/ItemData.dart';
import '../../../../Core/Utils/Style/Colors.dart';


DataRow buildDataRowItems({required ItemData itemModel}) {
  return DataRow(
    cells: [
      DataCell(
        Text(itemModel.productName)
      ),
      DataCell(
          Text(itemModel.itemUnit),
      ),
      DataCell(
        Text(itemModel.itemQuantity.toString()),
      ),
      DataCell(
        Text(itemModel.itemPrice.toString()),
      ),
      DataCell(
        Text(itemModel.value.toString()),
      ),
      DataCell(
        IconButton(
          icon: const Icon(Icons.delete, color: AppColor.red,),
          onPressed: () {

          },
        ),
      ),
    ],
  );
}