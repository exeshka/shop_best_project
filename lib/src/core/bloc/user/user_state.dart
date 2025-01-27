part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserStateInitial extends UserState {}

final class UserStateLoading extends UserState {}

final class UserStateEmpty extends UserState {}

final class UserStateError extends UserState {
  final UserException error;

  const UserStateError({required this.error});

  @override
  List<Object> get props => [error];
}

class UserStateSuccess extends UserState {
  final UserModel userModel;

  const UserStateSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}
