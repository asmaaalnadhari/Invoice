import 'package:flutter/material.dart';
import '../../../Core/Utils/Style/Colors.dart';
import '../../../Core/Utils/Style/TextStyle.dart';

Row buildHeaderItem({
  required String title,
  required Widget content
})=>Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(title, style: titleFont.copyWith(fontSize: 15,color: AppColor.white,fontWeight: FontWeight.bold),),
    content
  ],
);