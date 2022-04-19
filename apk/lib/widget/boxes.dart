import 'package:hive/hive.dart';
import 'package:aplikacja_do_promocji_bankowych/model/karencja.dart';

class Boxes {
  static Box<Karencja> getKarencja() => Hive.box<Karencja>('karencja');
  static Box<MyFavorite> getMyFavorite() => Hive.box<MyFavorite>('myFavorite');
}
