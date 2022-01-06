import 'package:birbir/data/endpoint/account/get_Profile.dart';
import 'package:birbir/data/endpoint/account/set_avatar.dart';
import 'package:birbir/data/model/account/profile_model.dart';
import 'package:birbir/data/service/api/api.dart';

abstract class AccountRepository {
  Future<ProfileModel> getProfile();
  Future<String> setAvatar(SetAvatarInput input);
}

class AccountRepositoryImpl implements AccountRepository {
  final ApiService apiService;

  AccountRepositoryImpl(this.apiService);

  @override
  Future<ProfileModel> getProfile() async {
    return await apiService.task<ProfileModel>(GetProfileEndpoint());
  }

  @override
  Future<String> setAvatar(SetAvatarInput input) async {
    return await apiService.task<String>(SetAvatarEndpoint(setAvatarInput: input));
  }
}
