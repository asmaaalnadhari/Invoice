part of 'get_invoice_cubit.dart';

@immutable
abstract class GetInvoiceState {}

///GetInvoice:
class GetInvoiceInitial extends GetInvoiceState {}

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