import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class MyFavorite extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  bool isFavorite;

  @HiveField(2)
  Map<int, Map<String, bool>> rewards;
}
