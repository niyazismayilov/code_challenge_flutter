import 'package:dio/dio.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST [ ${options.method}] => URL: ${options.uri} => BODY: ${options.data} ]');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE [ ${response.statusCode}] => DATA: ${response.data} ]');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR [ ${err.response?.statusCode}] => PATH: ${err.requestOptions.path} ]');
    return super.onError(err, handler);
  }
}