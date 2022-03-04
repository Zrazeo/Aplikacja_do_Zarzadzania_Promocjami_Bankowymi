// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'karencja.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KarencjaAdapter extends TypeAdapter<Karencja> {
  @override
  final int typeId = 0;

  @override
  Karencja read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Karencja()
      ..nazwa = fields[0] as String
      ..data = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Karencja obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nazwa)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KarencjaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
