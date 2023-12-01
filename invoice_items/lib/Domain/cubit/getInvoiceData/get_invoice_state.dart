part of 'get_invoice_cubit.dart';

@immutable
abstract class GetInvoiceState {}
class GetInvoiceInitial extends GetInvoiceState {}

///GetInvoice:
class GetAllInvoiceLoading extends GetInvoiceState {}
class GetAllInvoiceSuccess extends GetInvoiceState {
  final List<InvoiceData>invoiceData;
  GetAllInvoiceSuccess({required this.invoiceData});
}
class GetAllInvoiceFailure extends GetInvoiceState {}

///GetItemsForSpecificInvoice:
class GetAllItemsOfInvoiceLoading extends GetInvoiceState {}
class GetAllItemsOfInvoiceSuccess extends GetInvoiceState {
  final List<ItemData>itemsData;
  GetAllItemsOfInvoiceSuccess({required this.itemsData});
}
class GetAllItemsOfInvoiceFailure extends GetInvoiceState {}