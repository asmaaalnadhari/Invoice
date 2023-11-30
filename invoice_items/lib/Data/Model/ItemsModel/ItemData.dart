// item_data.dart
import 'package:hive/hive.dart';
part 'ItemData.g.dart';

@HiveType(typeId: 0)
class ItemData extends HiveObject {
  @HiveField(0)
  String productName;

  @HiveField(1)
  String itemUnit;

  @HiveField(2)
  double itemQuantity;

  @HiveField(3)
  double itemPrice;

  @HiveField(4)
  double value;

  @HiveField(5)
  int? invoiceId;

  ItemData({
    this.invoiceId,
    required this.productName,
    required this.itemUnit,
    required this.itemQuantity,
    required this.itemPrice,
    required this.value,
  });
}
