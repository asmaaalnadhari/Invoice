import 'package:bloc/bloc.dart';
import 'package:invoice_items/Data/Model/InvoicesModel/InvoiceData.dart';
import 'package:meta/meta.dart';
import '../../../Data/Model/ItemsModel/ItemData.dart';
import '../../../Data/Repository/repository.dart';
part 'get_invoice_state.dart';
//-----------------------------------------------------
class GetInvoiceCubit extends Cubit<GetInvoiceState> {
  GetInvoiceCubit(this.repository) : super(GetInvoiceInitial());
  List<ItemData>itemsData=[];
  List<InvoiceData>invoicesData=[];
  int itemCounts=0;
  final HiveRepository repository;

  Future<List<ItemData>> getItemsForInvoice(int invoiceId) async {
    emit(GetAllItemsOfInvoiceLoading());
    try {
      List<ItemData> items = await repository.getItemsForInvoice(invoiceId);
      emit(GetAllItemsOfInvoiceSuccess( itemsData:items));
      itemCounts=items.length;
      return items;
    } catch (e) {
      print('\nGetItemsForInvoiceFailure : ${e.toString()}\n');
      emit(GetAllItemsOfInvoiceFailure());
      return [];
    }
  }

  Future<List<InvoiceData>> getAllInvoices() async {
    emit(GetAllInvoiceLoading());
    try {
      List<InvoiceData> invoices = await repository.getAllInvoices();
      emit(GetAllInvoiceSuccess( invoiceData:invoices));
      print('\nGetAllInvoiceSuccess \n');

      return invoices;
    } catch (e) {
      print('\nGetAllInvoicesFailure : ${e.toString()}\n');
      emit(GetAllInvoiceFailure());
      return [];
    }
  }

  // Future<int> getItemsCountForInvoice(int invoiceId) async {
  //   // emit(AddInvoiceLoading());
  //   try {
  //     List<ItemData> items = await repository.getItemsForInvoice(invoiceId);
  //     int itemCount = items.length;
  //     // emit(GetItemsCountForInvoiceSuccess(itemCount));
  //     return itemCount;
  //   } catch (e) {
  //     print('\nGetItemsCountForInvoiceFailure : ${e.toString()}\n');
  //     // emit(GetItemsCountForInvoiceFailure());
  //     return 0;
  //   }
  // }

}
