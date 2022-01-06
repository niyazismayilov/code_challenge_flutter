import 'package:birbir/data/endpoint/base/endpoint.dart';

class SetAvatarEndpoint extends Endpoint {
  final SetAvatarInput setAvatarInput;

  SetAvatarEndpoint({required this.setAvatarInput});

  @override
  HttpMethod get httpMethod => HttpMethod.POST;

  @override
  String get route => "account/setAvatar";

  @override
  Map<String, dynamic>? get queryParameters => setAvatarInput.toJson();
}

class SetAvatarInput {
  final int avatarId;

  SetAvatarInput({required this.avatarId});

  Map<String, dynamic> toJson() {
    return {
      "avatarId": avatarId,
    };
  }
}
