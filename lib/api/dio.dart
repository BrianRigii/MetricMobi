import 'package:dio/dio.dart';
import 'package:metric/services/auth_service.dart';
import 'package:metric/utils/connectivity_util.dart';

// import 'package:metric/services/auth_service.dart';

class DioApi {
  Dio dio;

  DioApi(String apiUrl) {
    dio = Dio();

    dio.options.baseUrl = apiUrl;

    void _requestIntercept(
        RequestOptions options, RequestInterceptorHandler handler) {
      if (authService.isLoggedIn) {
        options.headers = {
          'Authorization': 'Bearer ${authService.authUser.accessToken}'
        };
      }

      print(
          "${options?.method}: ${options?.baseUrl}${options?.path} ${options?.queryParameters} ${options.data}");
      return handler.next(
        options,
      );
    }

    void _responseIntercept(
        response, ResponseInterceptorHandler responseHandler) {
      // print("${response.request?.path} ${response?.data}");
      print('$response');
      return responseHandler.next(response);
    }

    void _errorIntercept(DioError error, ErrorInterceptorHandler errorHandler) {
      print(
        "${error.requestOptions?.path} ${error.response?.data}",
      );
      return errorHandler.next(error);
    }

    dio.interceptors.add(InterceptorsWrapper(onRequest: _requestIntercept));
    dio.interceptors.add(InterceptorsWrapper(onResponse: _responseIntercept));
    dio.interceptors.add(InterceptorsWrapper(onError: _errorIntercept));
  }
}
