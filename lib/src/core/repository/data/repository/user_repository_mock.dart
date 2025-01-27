import 'package:shop_best_project/src/core/models/user_model.dart';
import 'package:shop_best_project/src/core/repository/domain/repository/user_repository.dart';

class UserRepositoryMock implements UserRepository {
  @override
  Future<UserModel> getMyUser() async {
    await Future.delayed(Duration(milliseconds: 600));

    return UserModel.mock();
  }
}
