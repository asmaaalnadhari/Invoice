// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InvoiceData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceDataAdapter extends TypeAdapter<InvoiceData> {
  @override
  final int typeId = 1;

  @override
  InvoiceData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InvoiceData(
      invoiceNumber: fields[0] as int,
      invoiceDate: fields[1] as String,
      coins: fields[2] as String,
      total: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.invoiceNumber)
      ..writeByte(1)
      ..write(obj.invoiceDate)
      ..writeByte(2)
      ..write(obj.coins)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
