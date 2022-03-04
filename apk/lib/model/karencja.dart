import 'package:hive/hive.dart';

part 'karencja.g.dart';

@HiveType(typeId: 0)
class Karencja extends HiveObject {
  @HiveField(0)
  String nazwa;

  @HiveField(1)
  String data;
}
