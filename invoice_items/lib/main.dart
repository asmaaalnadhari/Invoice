import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Utils/Style/Colors.dart';
import 'package:invoice_items/Core/global.dart';
import 'package:invoice_items/Data/Repository/repository.dart';
import 'package:invoice_items/Domain/cubit/add_invoice_cubit.dart';
import 'package:invoice_items/Domain/cubit/getInvoiceData/get_invoice_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Core/Shared/Components/components.dart';
import 'Core/Shared/shared_preferences/shared_prefrences.dart';
import 'Data/Model/InvoicesModel/InvoiceData.dart';
import 'Data/Model/ItemsModel/ItemData.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Presentaion/Screens/pageBills.dart';
//=============================================================
void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(InvoiceDataAdapter());
  await Hive.openBox<InvoiceData>(kInvoiceBox);
  Hive.registerAdapter(ItemDataAdapter());
  await Hive.openBox<ItemData>(kItemBox);
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>AddInvoiceCubit(HiveRepository())..addRow()),
        BlocProvider(create: (context) =>GetInvoiceCubit(HiveRepository())..getAllInvoices()),

      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Hacen',
          primarySwatch: buildMaterialColor(AppColor.teal)
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale('ar'),
        home:  const SafeArea(child:PageBills()),
      ),
    );
  }
}
