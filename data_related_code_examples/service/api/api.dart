import 'package:birbir/data/endpoint/base/endpoint.dart';
import 'package:birbir/data/exception/http_exception.dart';
import 'package:birbir/data/model/base/response_model.dart';
import 'package:birbir/data/service/preferences/preference.dart';
import 'package:dio/dio.dart';

import 'package:connectivity/connectivity.dart';

import 'logging.dart';

class ApiService {
  final _dio = Dio();

  ApiService() {
    _dio.options
      ..baseUrl = "https://bir-bir.nsp.solutions/api/"
      ..contentType = 'application/Json'
      ..headers = {};
    _dio.interceptors.add(Logging());
  }

  Future<dynamic> task<T>(Endpoint endpoint) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      if (endpoint.httpMethod == HttpMethod.GET) {
        return get<T>(endpoint);
      } else if (endpoint.httpMethod == HttpMethod.POST) {
        return post<T>(endpoint);
      }
    } else {
      throw HttpException("Please, check internet connection");
    }
  }

  Future<dynamic> post<T>(Endpoint endpoint) async {
    final prefs = await PreferencesService.instance;

    final Map<String, dynamic> headers = {"accept": "*/*"};

    if (prefs.accessToken != null) {
      headers["Authorization"] = prefs.accessToken;
    }

    final options = Options(headers: headers);

    try {
      final response = await _dio.post(
        endpoint.route,
        data: endpoint.body,
        queryParameters: endpoint.queryParameters,
        options: options,
      );

      if ([200, 201].contains(response.statusCode)) {
        final request = ResponseModel<T>.fromJson(response.data);

        if (request.isSuccessful && request.hasData) {
          return request.response;
        } else if (request.isSuccessful && !request.hasData) {
          return request.message;
        } else {
          throw HttpException(request.message);
        }
      } else {
        throw HttpException(response.statusMessage ?? "Unknown error happened");
      }
    } on DioError catch (e) {
      throw HttpException(e.error.toString());
    }
  }

  Future<dynamic> get<T>(Endpoint endpoint) async {
    final prefs = await PreferencesService.instance;

    final Map<String, dynamic> headers = {"accept": "*/*"};

    if (prefs.accessToken != null) {
      headers["Authorization"] = prefs.accessToken;
    }

    final options = Options(headers: headers);

    try {
      final response = await _dio.get(
        endpoint.route,
        queryParameters: endpoint.queryParameters,
        options: options,
      );

      if ([200, 201].contains(response.statusCode)) {
        final request = ResponseModel<T>.fromJson(response.data);

        if (request.isSuccessful && request.hasData) {
          return request.response;
        } else if (request.isSuccessful && !request.hasData) {
          return request.message;
        } else {
          throw HttpException(request.message);
        }
      } else {
        throw HttpException(response.statusMessage ?? "Unknown error happened");
      }
    } on DioError catch (e) {
      throw HttpException(e.error.toString());
    }
  }
}
