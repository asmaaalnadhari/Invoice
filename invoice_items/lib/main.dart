import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Utils/Style/Colors.dart';

import 'Core/Shared/Components/components.dart';
import 'Presentaion/Screens/AddItemToInvoicePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(
        fontFamily: 'Hacen',
        primarySwatch: buildMaterialColor(AppColor.teal)
      ),

      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: AddItems()),
    );
  }
}
