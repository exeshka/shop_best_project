import 'package:shop_best_project/src/core/models/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel> getMyUser();
}
