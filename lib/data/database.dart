import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metric/data/models/auth_model.dart';

class Database {
  Box<AuthModel> authBox;
  Box deviceSettings;

  init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _initailiseBoxes();
  }

  void _registerAdapters() {
    Hive.registerAdapter(AuthModelAdapter());
    Hive.registerAdapter(UserCourseAdapter());
  }

  _initailiseBoxes() async {
    authBox = await Hive.openBox('authbox');
    deviceSettings = await Hive.openBox('devicesettings');
  }
}

Database db = Database();
