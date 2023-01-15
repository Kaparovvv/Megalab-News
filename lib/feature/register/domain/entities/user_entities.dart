import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String lastName;
  final String nickname;
  final String profileImage;

  const UserEntity({
    required this.id,
    required this.name,
    required this.lastName,
    required this.nickname,
    required this.profileImage,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        lastName,
        nickname,
        profileImage,
      ];
}
