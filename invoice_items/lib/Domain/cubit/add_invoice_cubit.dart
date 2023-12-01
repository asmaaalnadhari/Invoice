import 'package:bloc/bloc.dart';
import 'package:invoice_items/Data/Model/InvoicesModel/InvoiceData.dart';
import 'package:invoice_items/Data/Model/ItemsModel/ItemData.dart';
import 'package:meta/meta.dart';
import '../../Core/Shared/shared_preferences/shared_prefrences.dart';
import '../../Core/global.dart';
import '../../Data/Repository/repository.dart';
import 'package:flutter/material.dart';
part 'add_invoice_state.dart';
//--------------------------------------------
class AddInvoiceCubit extends Cubit<AddInvoiceState> {
  AddInvoiceCubit(this.repository) : super(AddInvoiceInitial());
  ///variables:
  final HiveRepository repository;
  List<Map<String, TextEditingController>> tableData = [];
//--------------------------------------------
  ///addInvoice
  Future<void> addInvoice({required InvoiceData invoiceData}) async
  {
    emit(AddInvoiceLoading());
    print('\AddInvoiceLoading\n');
    List<ItemData> items = convertTableData(tableData);
    print('============Before Adding:==========invoiceData: $invoiceData\nItemData:$items');
    try {
      repository.addInvoice(invoiceData).then((value)async{
        await repository.addItemsToInvoice(value, items);
      } );
      print('\nAddInvoiceSuccess\n');
      CacheData.setData(key: 'idInvoice', value: CacheData.getData(key: 'idInvoice')+1);
      tableData.clear();
      clear();
      invoiceNumber=await CacheData.getNextId();
      emit(AddInvoiceSuccess());

 } catch (e) {
      print('\nAddInvoiceFailure : ${e.toString()}\n');
      emit(AddInvoiceSuccess());
    }
  }
  ///01# addRow
  void addRow()
  {
    tableData.add({
      'productName': TextEditingController(),
      'itemUnit': TextEditingController(),
      'itemQuantity': TextEditingController(),
      'itemPrice': TextEditingController(),
      'value': TextEditingController(),
    });
    emit(AddInvoiceRow());
  }
  ///chaneQuantity:
  void chaneQuantity()
  {
  emit(AddInvoiceQuantity());
}
  ///chanePrice:
  void chanePrice()
  {
    emit(AddInvoicePrice());
  }
  ///removeRow:
  void removeRow()
  {
    emit(RemoveInvoiceRow());
  }
  ///ConvertData:
  List<ItemData> convertTableData(List<Map<String, TextEditingController>> tableData) {
    List<ItemData> items = [];
    for (var data in tableData) {
      ItemData item = ItemData(
        productName: data['productName']!.text,
        itemUnit: data['itemUnit']!.text,
        itemQuantity: double.tryParse(data['itemQuantity']!.text) ?? 0,
        itemPrice: double.tryParse(data['itemPrice']!.text) ?? 0,
        value: double.tryParse(data['value']!.text) ?? 0,
      );
      items.add(item);
    }
    return items;
  }
  void clear()
  {
   totalQuantity = 0;
   totalPrice = 0;
   totalValue = 0;
   controlCoins.clear();
   addRow();
}
}

