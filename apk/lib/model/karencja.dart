import 'package:hive/hive.dart';

part 'karencja.g.dart';

@HiveType(typeId: 0)
class Karencja extends HiveObject {
  @HiveField(0)
  String nazwa;

  @HiveField(1)
  String data;
}

@HiveType(typeId: 1)
class MyFavorite extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  bool isFavorite;

  @HiveField(2)
  Map<String, Map<String, bool>> requirements;

  @HiveField(3)
  String bankName;

  @HiveField(4)
  Map<String, dynamic> rewards;
}
