// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemDataAdapter extends TypeAdapter<ItemData> {
  @override
  final int typeId = 0;

  @override
  ItemData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemData(
      invoiceId: fields[5] as int?,
      productName: fields[0] as String,
      itemUnit: fields[1] as String,
      itemQuantity: fields[2] as double,
      itemPrice: fields[3] as double,
      value: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ItemData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.itemUnit)
      ..writeByte(2)
      ..write(obj.itemQuantity)
      ..writeByte(3)
      ..write(obj.itemPrice)
      ..writeByte(4)
      ..write(obj.value)
      ..writeByte(5)
      ..write(obj.invoiceId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
