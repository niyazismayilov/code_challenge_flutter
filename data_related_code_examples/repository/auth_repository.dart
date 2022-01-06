import 'package:birbir/data/endpoint/auth/token.dart';
import 'package:birbir/data/model/auth/access_token_model.dart';
import 'package:birbir/data/service/api/api.dart';

abstract class AuthRepository {
  Future<AccessTokenModel> token(TokenInput input);
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<AccessTokenModel> token(TokenInput input) async {
    return await apiService.task<AccessTokenModel>(TokenEndpoint(tokenInput: input));
  }
}
