import 'package:hive/hive.dart';
part 'InvoiceData.g.dart';

@HiveType(typeId: 1)
class InvoiceData extends HiveObject {
  @HiveField(0)
  int invoiceNumber;

  @HiveField(1)
  String invoiceDate;

  @HiveField(2)
  String coins;

  @HiveField(3)
  double total;

  InvoiceData({
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.coins,
    required this.total,
  });
}