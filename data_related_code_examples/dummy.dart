import 'package:birbir/app/injection/get_it.dart';
import 'package:birbir/data/endpoint/auth/token.dart';
import 'package:birbir/data/repository/security_repository.dart';
import 'package:birbir/data/repository/auth_repository.dart';

import 'endpoint/security/verify_mobile.dart';

class DummyDataCheck {
  static fetch() async {
    final AuthRepository authRepository = getIt.get();
    final SecurityRepository accountRepository = getIt.get();

    final input = TokenInput(username: "Admin", password: "P@ssw0rd123!");
    final accessTokenModel = await authRepository.token(input);
    print(accessTokenModel);

    final smsCodeInput = VerifyMobileInput(mobile: "994507825544");
    final smsCodeModel = await accountRepository.verifyMobile(smsCodeInput);
    print(smsCodeModel);
  }
}
