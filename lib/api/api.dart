import 'package:metric/api/dio.dart';

import 'package:metric/app_config.dart';

class Api extends DioApi {
  Api() : super(AppConfig.appUrl);

  Future login(String reference, String password) {
    print('Password is $password and ref $reference ');
    return dio.post('/login', queryParameters: {
      "reference": reference,
      "password": password,
    });
  }
}

Api api = Api();
