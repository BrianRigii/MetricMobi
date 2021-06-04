import 'package:dio/dio.dart';

// import 'package:metric/services/auth_service.dart';

class DioApi {
  Dio dio;

  DioApi(String apiUrl) {
    dio = Dio();

    dio.options.baseUrl = apiUrl;

    void _requestIntercept(
        RequestOptions options, RequestInterceptorHandler handler) {
      print(
          "REQUEST: ${options?.method}: ${options?.baseUrl}${options?.path} ${options?.queryParameters}");
    }

    void _responseIntercept(response, responseHandler) {
      print("${response.request?.path} ${response?.data}");
    }

    void _errorIntercept(DioError error, errorHandler) {
      print("${error.requestOptions?.path} ${error.response?.data}");
    }

    dio.interceptors.add(InterceptorsWrapper(onRequest: _requestIntercept));
    dio.interceptors.add(InterceptorsWrapper(onResponse: _responseIntercept));
    dio.interceptors.add(InterceptorsWrapper(onError: _errorIntercept));
  }
}
