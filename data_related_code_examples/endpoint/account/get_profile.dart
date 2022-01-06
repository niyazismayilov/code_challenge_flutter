import 'package:birbir/data/endpoint/base/endpoint.dart';

class GetProfileEndpoint extends Endpoint {
  @override
  HttpMethod get httpMethod => HttpMethod.GET;

  @override
  String get route => "account/getProfile";
}
