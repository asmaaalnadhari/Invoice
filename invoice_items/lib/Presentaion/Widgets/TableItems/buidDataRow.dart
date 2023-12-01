import 'package:flutter/material.dart';
import 'package:invoice_items/Core/global.dart';
import '../../../Core/Utils/Style/Colors.dart';
import '../../../Core/Utils/Style/TextStyle.dart';
import '../../../Domain/cubit/add_invoice_cubit.dart';
import '../TextFieldAndInput/UpdateTotal.dart';
import '../TextFieldAndInput/buildInputDecoration.dart';
import '../TextFieldAndInput/dropDown.dart';
import '../TextFieldAndInput/validateOfNumeric.dart';

///03#buildDataRow:
DataRow buildDataRow(Map<String, TextEditingController> data,{required AddInvoiceCubit cubit}) {
  TextEditingController itemQuantityController = data['itemQuantity']!;
  TextEditingController itemPriceController = data['itemPrice']!;
  TextEditingController valueController = data['value']!;
  void calculateValue() {
    double itemQuantity = double.tryParse(itemQuantityController.text) ?? 1;
    double itemPrice = double.tryParse(itemPriceController.text) ?? 0;
    double value = itemQuantity * itemPrice;
    valueController.text = value.toString();
  }
  return DataRow(
    cells: [
      DataCell(
        TextFormField(
          style: bodyFont,
          keyboardType: TextInputType.text,
          controller: data['productName'],
          decoration: buildInputDecoration('اسم الصنف'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'يجب إدخال اسم الصنف';
            }
            return null;
          },
        ),
      ),
      DataCell(
        BuildDropDown(hintText: 'الوحدة',
          option:itemUnits,
          controller: data['itemUnit']!,),
      ),
      DataCell(
        TextFormField(
          style: bodyFont,
          controller: itemQuantityController,
          keyboardType: TextInputType.number,
          decoration: buildInputDecoration('الكمية'),
          onChanged: (value) {
            calculateValue();
            updateTotals(tableData: cubit.tableData);
            cubit.chaneQuantity();
          },
          validator: (value) {
            if (!isNumeric(value)) {
              return 'ادخل كمية صحيحة';
            }
            return null;
          },
        ),
      ),
      DataCell(
        TextFormField(
          style: bodyFont,
          controller: itemPriceController,
          keyboardType: TextInputType.number,
          decoration: buildInputDecoration('السعر'),
          onChanged: (value) {
            calculateValue();
            updateTotals(tableData: cubit.tableData);
            cubit.chanePrice();
          },
          validator: (value) {
            if (!isNumeric(value)) {
              return 'ادخل السعر بطريقة صحيحة';
            }
            return null;
          },
        ),
      ),
      DataCell(
        TextFormField(
          controller: valueController,
          enabled: false,
          style: bodyFont,
          // onChanged: (value){
          //   setState(() {
          //     updateTotals(tableData: tableData);
          // },
          decoration: buildInputDecoration('القيمة'),
          validator: (value) {
            return null;
          },
        ),
      ),
      DataCell(
        IconButton(
          icon: const Icon(Icons.delete, color: AppColor.red,),
          onPressed: () {
            cubit.tableData.remove(data);
            updateTotals(tableData: cubit.tableData);
            cubit.removeRow();
          },
        ),
      ),
    ],
  );
}
