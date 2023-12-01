import 'package:flutter/material.dart';
import 'package:invoice_items/Data/Model/ItemsModel/ItemData.dart';
import '../../../../Core/Utils/Style/Colors.dart';
import '../../../../Core/Utils/Style/TextStyle.dart';

DataRow buildDataRowItems({required ItemData itemModel}) {
  return DataRow(
    cells: [
      DataCell(
        Text(itemModel.productName,style: bodyFont.copyWith(color: AppColor.blackLight),
        )
      ),
      DataCell(
          Text(itemModel.itemUnit,style: bodyFont.copyWith(color: AppColor.blackLight),),
      ),
      DataCell(
        Text(itemModel.itemQuantity.toString(),style: bodyFont.copyWith(color: AppColor.blackLight),),
      ),
      DataCell(
        Text(itemModel.itemPrice.toString(),style: bodyFont.copyWith(color: AppColor.blackLight),),
      ),
      DataCell(
        Text(itemModel.value.toString(),style: bodyFont.copyWith(color: AppColor.blackLight),),
      ),
    ],
  );
}