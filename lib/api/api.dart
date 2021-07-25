import 'package:metric/api/dio.dart';

import 'package:metric/app_config.dart';
import 'package:metric/utils/time_util.dart';

class Api extends DioApi {
  Api() : super(AppConfig.appUrl);

  Future login(String reference, String password, String deviceToken) {
    print('sending this token $deviceToken ');
    return dio.post('/login', data: {
      "reference": reference,
      "password": password,
      "device_token": deviceToken
    });
  }

  Future getUnits() {
    return dio.get('/units');
  }

  Future getTopics(int unitId) {
    return dio.get('/topics/$unitId');
  }

  Future getNotes(
    unitId,
    unitPeriodId,
  ) {
    return dio.get('/notes',
        queryParameters: {'unit_period_id': unitPeriodId, 'unit_id': unitId});
  }

  Future getDateClasses(DateTime start, DateTime end) {
    return dio.get('timetable-occurrence', queryParameters: {
      'start': hyphenedDates(start),
      'end': hyphenedDates(start)
    });
  }

  Future fileDownload(String filePath, String storagePath) {
    return dio.download(filePath, storagePath);
  }
}

Api api = Api();
