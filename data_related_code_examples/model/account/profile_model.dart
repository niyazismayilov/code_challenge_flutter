import 'package:birbir/data/model/base/generic_profile_model.dart';

import 'favorite.dart';
import 'randevu.dart';

class ProfileModel extends GenericProfileModel {
  @override
  String name;

  @override
  String surname;

  @override
  String? avatar;

  String? email;
  String mobile;
  List<Randevu> randevuList;
  List<Favorite> favoriteList;

  ProfileModel({
    required this.name,
    required this.surname,
    this.avatar,
    this.email,
    required this.mobile,
    required this.randevuList,
    required this.favoriteList,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        surname: json["surname"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"],
        randevuList: List<Randevu>.from(json["randevuList"].map((x) => x)),
        favoriteList: List<Favorite>.from(json["favoriteList"].map((x) => x)),
      );

  bool get hasRandevu => randevuList.isNotEmpty;

  bool get hasFavorite => favoriteList.isNotEmpty;
}
