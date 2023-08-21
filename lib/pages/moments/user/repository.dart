import 'package:get/get.dart';

import '../../../network/moments/api.dart';
import '../../../network/moments/model/user.dart';

class UserRepository {
  final MomentsApi _momentsApi;

  UserRepository({MomentsApi? momentsApi})
      : _momentsApi = momentsApi ?? Get.find();

  Future<User> getUser() => _momentsApi.getUser();
}
