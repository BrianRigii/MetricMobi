import 'package:hive/hive.dart';

part '../adapters/auth_model.g.dart';

@HiveType(typeId: 1)
class AuthModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String referenceid;
  @HiveField(2)
  final String photoUrl;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String accessToken;
  @HiveField(6)
  final String deviceToken;
  @HiveField(7)
  final String notificationChannel;
  @HiveField(8)
  final List<UserCourse> courses;
  @HiveField(9)
  final String name;
  AuthModel({
    this.id,
    this.referenceid,
    this.photoUrl,
    this.phone,
    this.email,
    this.accessToken,
    this.deviceToken,
    this.notificationChannel,
    this.courses,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'referenceid': referenceid,
      'photoUrl': photoUrl,
      'phone': phone,
      'email': email,
      'accessToken': accessToken,
      'deviceToken': deviceToken,
      'notificationChannel': notificationChannel,
      'courses': courses?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthModel(
      id: map['user']['id'],
      name: map['user']['name'],
      referenceid: map['user']['referenceid'],
      photoUrl: map['user']['photoUrl'],
      phone: map['user']['phone'],
      email: map['user']['email'],
      accessToken: map['token'],
      deviceToken: map['user']['device_token'],
      notificationChannel: map['user']['preferred_notification_channel'],
      courses: List<UserCourse>.from(
          map['courses']?.map((x) => UserCourse.fromMap(x))),
    );
  }
}

@HiveType(typeId: 2)
class UserCourse {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String code;
  @HiveField(3)
  final int departmentid;
  @HiveField(4)
  final String department;

  UserCourse(
      {this.id, this.name, this.code, this.departmentid, this.department});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'departmentid': departmentid,
      'department': department,
    };
  }

  factory UserCourse.fromMap(Map<String, dynamic> course) {
    if (course == null) return null;

    return UserCourse(
      id: course["id"],
      name: course['name'],
      code: course['code'],
      departmentid: course['department']['id'],
      department: course['department']['name'],
    );
  }
}
