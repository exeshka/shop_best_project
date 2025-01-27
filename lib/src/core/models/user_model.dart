import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:shop_best_project/src/core/models/image_model.dart';

class UserModel extends Equatable {
  final int id;
  final String userName;
  final String userLastname;
  final String email;

  final ImageModel image;

  const UserModel({
    required this.id,
    required this.userName,
    required this.userLastname,
    required this.image,
    required this.email,
  });

  @override
  List<Object?> get props => [id, userName, userLastname, email];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      image: ImageModel.fromJson(json['image']),
      id: json['id'],
      userName: json['user_name'],
      userLastname: json['user_last_name'],
      email: json['email'],
    );
  }

  factory UserModel.mock({
    int? id,
    String? userName,
    String? userLastname,
    String? email,
  }) {
    return UserModel(
      image: ImageModel(
          url:
              "https://zefirka.club/uploads/posts/2022-11/thumbs/1669156257_1-zefirka-club-p-krasnie-avatarki-anime-1.jpg",
          hash: 'L2AQLS1^1^WVsUJlFHFH;%jt|dWp'),
      id: id ?? Random().nextInt(1000), // Генерируем случайный ID
      userName: userName ?? 'John${Random().nextInt(100)}',
      userLastname: userLastname ?? 'Doe${Random().nextInt(100)}',
      email: email ?? 'johndoe${Random().nextInt(100)}@example.com',
    );
  }
}

List<UserModel> mockUsers() {
  return List.generate(
    10,
    (index) => UserModel.mock(
      id: index + 1,
      userName: 'User$index',
      userLastname: 'LastName$index',
      email: 'user$index@example.com',
    ),
  );
}
