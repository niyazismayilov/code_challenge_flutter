enum HttpMethod { GET, POST, PUT, DELETE }

abstract class Endpoint {
  late HttpMethod httpMethod;
  late String route;
  Map<String, dynamic>? body = {};
  Map<String, dynamic>? queryParameters = {};
}
