import 'package:metric/api/dio.dart';

import 'package:metric/app_config.dart';

class Api extends DioApi {
  Api() : super(AppConfig.appUrl);

  Future login(String reference, String password) {
    return dio.post('/login', data: {
      "reference": reference,
      "password": password,
    });
  }

  Future getUnits() {
    return dio.get('/units');
  }
}

Api api = Api();
