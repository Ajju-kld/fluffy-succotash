// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

import 'package:hive/hive.dart';

import 'Qrcode_data.dart';

class qrcodedataAdapter extends TypeAdapter<qrcode_data> {
  @override
  final int typeId = 0;

  @override
  qrcode_data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return qrcode_data(
      name: fields[0] as String?,
      url: fields[1] as String?,
      style: fields[2] as bool?,
      eye_style: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, qrcode_data obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.style)
      ..writeByte(3)
      ..write(obj.eye_style);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is qrcodedataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
