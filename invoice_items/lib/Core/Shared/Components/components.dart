import'package:flutter/material.dart';

import '../../Utils/Style/Colors.dart';
import '../../Utils/Style/TextStyle.dart';
import '../../Utils/app_sizes.dart';
//-------------------Add Theme Color--------------------
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

//buildMessage:
void buildMessage({required BuildContext context,required String msg}){
  ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(msg),
      ));
}

//buildButton:
Widget buildButton({
  required VoidCallback onTap,
  required String label,
  required IconData icon,
  required BuildContext context
}) {
  return Padding(
    padding:  EdgeInsets.symmetric(vertical:AppSize.padding4(context)),
    child: ElevatedButton.icon(
      onPressed:onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.teal,
          side:const BorderSide(
            color: AppColor.white,
            width: 2,
          )),
      icon:  Icon(icon,color: AppColor.white,),
      label:  Text(label,style: bodyFont.copyWith(color: AppColor.white),),
    ),
  );
}

//buildDropDown:
