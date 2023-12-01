import 'package:hive/hive.dart';
import 'package:invoice_items/Core/global.dart';
import '../Model/InvoicesModel/InvoiceData.dart';
import '../Model/ItemsModel/ItemData.dart';
//-------------------------------------------------
class HiveRepository {
  ///openBox(ItemData,InvoiceData).
  Future<Box<ItemData>> openItemBox() async {
    return await Hive.openBox<ItemData>(kItemBox);
  }
  Future<Box<InvoiceData>> openInvoiceBox() async {
    return await Hive.openBox<InvoiceData>(kInvoiceBox);
  }
//----------------------------------------------------
  ///addInvoice
  Future<int> addInvoice(InvoiceData invoiceData) async {
    final invoiceBox = await openInvoiceBox();
    return await invoiceBox.add(invoiceData);
  }
  ///addItemsToInvoice
  Future<void> addItemsToInvoice(int invoiceId, List<ItemData> items) async {
    final itemBox = await openItemBox();
    for (ItemData item in items) {
      item.invoiceId = invoiceId;
      await itemBox.add(item);
    }
  }
  ///getItemsForInvoice
  Future<List<ItemData>> getItemsForInvoice(int invoiceId) async {
    final itemBox = await openItemBox();
    return itemBox.values.where((item) => item.invoiceId == invoiceId).toList();
  }
  ///getAllInvoices:
  Future<List<InvoiceData>> getAllInvoices() async {
    final invoiceBox = await openInvoiceBox();
    return invoiceBox.values.toList();
  }
}
