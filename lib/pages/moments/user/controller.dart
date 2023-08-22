import 'package:flutter_practice/pages/moments/user/repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../component/async_loader/data_controller.dart';
import '../../../network/moments/model/user.dart';

class UserController extends DataController<User> {
  final UserRepository _repository;

  UserController({UserRepository? repository})
      : _repository = repository ?? UserRepository() {
    data = Rx<User>(const User(null, null, null, null));
  }

  @override
  Future<User> fetch() => _repository.getUser();
}
