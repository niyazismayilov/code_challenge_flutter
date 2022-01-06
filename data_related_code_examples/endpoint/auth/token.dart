import 'package:birbir/data/endpoint/base/endpoint.dart';

class TokenEndpoint extends Endpoint {
  final TokenInput tokenInput;

  TokenEndpoint({required this.tokenInput});

  @override
  HttpMethod get httpMethod => HttpMethod.POST;

  @override
  String get route => "login";

  @override
  Map<String, dynamic>? get body => tokenInput.toJson();
}

class TokenInput {
  String username;
  String password;

  TokenInput({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
