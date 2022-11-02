import 'package:hive/hive.dart';
@ HiveType(typeId: 0)
class qrcode_data extends HiveObject {
  @ HiveField(0)
  String? name;
  @ HiveField(1)
  String? url;
@ HiveField(2)
  bool? style;
  @HiveField(3)
  bool? eye_style;
  qrcode_data(
      {required this.name,
      required this.url,
      required this.style,
      required this.eye_style});
  qrcode_data.nonapplied() {
    name = " ";
    url = " ";
    style = true;
    eye_style = false;
  }

}
