import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_best_project/src/core/exception/user/user_exception.dart';
import 'package:shop_best_project/src/core/models/user_model.dart';
import 'package:shop_best_project/src/core/repository/domain/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userRepository) : super(UserStateInitial()) {
    on<GetMyUser>((event, emit) async {
      emit(UserStateLoading());

      try {
        UserModel userModel = await _userRepository.getMyUser();

        emit(UserStateSuccess(userModel: userModel));
      } on UserException catch (e) {
        emit(UserStateError(error: e));
      } catch (e) {
        emit(UserStateError(error: UserUnknownException()));
      }
    });
  }

  final UserRepository _userRepository;
}
