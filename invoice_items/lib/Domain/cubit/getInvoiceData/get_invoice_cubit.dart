import 'package:bloc/bloc.dart';
import 'package:invoice_items/Data/Model/InvoicesModel/InvoiceData.dart';
import 'package:meta/meta.dart';
import '../../../Data/Model/ItemsModel/ItemData.dart';
import '../../../Data/Repository/repository.dart';
part 'get_invoice_state.dart';
//-----------------------------------------------------
class GetInvoiceCubit extends Cubit<GetInvoiceState> {
  GetInvoiceCubit(this.repository) : super(GetInvoiceInitial());
  ///Variables:
  int itemCounts=0;
  final HiveRepository repository;
  ///getItemsForInvoice
  Future<void> getItemsForInvoice(int invoiceId) async {
    emit(GetAllItemsOfInvoiceLoading());
    try {
      List<ItemData> items = await repository.getItemsForInvoice(invoiceId);
      emit(GetAllItemsOfInvoiceSuccess( itemsData:items));
      print('\nGetAllItemsOfInvoiceSuccess}\n');
      itemCounts=items.length;
    } catch (e) {
      print('\nGetItemsForInvoiceFailure : ${e.toString()}\n');
      emit(GetAllItemsOfInvoiceFailure());
    }
  }
  ///getAllInvoices
  Future<void> getAllInvoices() async {
    emit(GetAllInvoiceLoading());
    try {
      List<InvoiceData> invoices = await repository.getAllInvoices();
      emit(GetAllInvoiceSuccess( invoiceData:invoices));
      print('\nGetAllInvoiceSuccess \n');

    } catch (e) {
      print('\nGetAllInvoicesFailure : ${e.toString()}\n');
      emit(GetAllInvoiceFailure());
    }
  }

}
