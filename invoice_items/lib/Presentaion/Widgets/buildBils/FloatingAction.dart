import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Utils/Style/Colors.dart';

FloatingActionButton floatingActionButton({required VoidCallback onTap})=>
    FloatingActionButton(
      backgroundColor: AppColor.teal,
      onPressed:onTap,
      child: const Icon(Icons.add,size: 20,color: AppColor.white,),
    );