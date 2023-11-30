part of 'add_invoice_cubit.dart';

@immutable
abstract class AddInvoiceState {}

class AddInvoiceInitial extends AddInvoiceState {}

class AddInvoiceLoading extends AddInvoiceState {}

class AddInvoiceSuccess extends AddInvoiceState {}

class AddInvoiceFailure extends AddInvoiceState {}

class AddInvoiceRow extends AddInvoiceState {}

///TextField:
class AddInvoiceQuantity extends AddInvoiceState {}
class AddInvoicePrice extends AddInvoiceState {}
class RemoveInvoiceRow extends AddInvoiceState {}
