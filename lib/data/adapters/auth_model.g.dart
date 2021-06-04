// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/auth_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthModelAdapter extends TypeAdapter<AuthModel> {
  @override
  final int typeId = 1;

  @override
  AuthModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthModel(
      id: fields[0] as int,
      referenceid: fields[1] as String,
      photoUrl: fields[2] as String,
      phone: fields[3] as String,
      email: fields[4] as String,
      accessToken: fields[5] as String,
      deviceToken: fields[6] as String,
      notificationChannel: fields[7] as String,
      courses: (fields[8] as List)?.cast<UserCourse>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.referenceid)
      ..writeByte(2)
      ..write(obj.photoUrl)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.accessToken)
      ..writeByte(6)
      ..write(obj.deviceToken)
      ..writeByte(7)
      ..write(obj.notificationChannel)
      ..writeByte(8)
      ..write(obj.courses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
