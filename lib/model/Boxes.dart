

import 'package:animation_1/model/Qrcode_data.dart';

import 'package:hive/hive.dart';

class Boxes {
  static Box<qrcode_data> getAdd_to_list() =>
      Hive.box<qrcode_data>('list_items');



}
