import 'package:flutter/material.dart';

import '../../../Core/global.dart';

updateTotals({
  required List<Map> tableData,

}) {
  totalQuantity = 0;
  totalPrice = 0;
  totalValue = 0;
  for (var data in tableData) {
    double quantity = double.tryParse(data['itemQuantity']!.text) ?? 0;
    double price = double.tryParse(data['itemPrice']!.text) ?? 0;
    double value = double.tryParse(data['value']!.text) ?? 0;
    print(data['value']!.text);
    totalQuantity+= quantity;
    totalPrice+= price;
    totalValue += value;
  }
}
