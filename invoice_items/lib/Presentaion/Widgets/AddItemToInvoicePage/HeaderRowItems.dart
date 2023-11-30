import 'package:flutter/material.dart';

import '../../../Core/Utils/Style/Colors.dart';
import '../../../Core/Utils/Style/TextStyle.dart';

Row buildHeaderItem({
  required String title,
  required String content

})=>Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(title, style: titleFont.copyWith(fontSize: 20,color: AppColor.white),),
    Text(content, style: titleFont.copyWith(fontSize: 20,color: AppColor.white),),
  ],
);