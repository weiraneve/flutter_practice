import 'package:flutter_practice/pages/moments/user/repository.dart';

import '../../../component/async_loader/data_controller.dart';
import '../../../network/moments/model/user.dart';

class UserController extends DataController<User> {
  final UserRepository _repository;

  UserController({UserRepository? repository})
      : _repository = repository ?? UserRepository();

  @override
  Future<User> fetch() => _repository.getUser();
}
