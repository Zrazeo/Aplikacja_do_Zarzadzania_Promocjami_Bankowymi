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

class MyFavoriteAdapter extends TypeAdapter<MyFavorite> {
  @override
  final int typeId = 1;

  @override
  MyFavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyFavorite()
      ..id = fields[0] as int
      ..isFavorite = fields[1] as bool
      ..requirements = (fields[2] as Map)?.map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as Map)?.cast<String, bool>()))
      ..bankName = fields[3] as String
      ..rewards = (fields[4] as Map)?.cast<String, dynamic>();
  }

  @override
  void write(BinaryWriter writer, MyFavorite obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isFavorite)
      ..writeByte(2)
      ..write(obj.requirements)
      ..writeByte(3)
      ..write(obj.bankName)
      ..writeByte(4)
      ..write(obj.rewards);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyFavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
