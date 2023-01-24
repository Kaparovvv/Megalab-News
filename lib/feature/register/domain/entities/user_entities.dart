import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final int id;
  final String name;
  final String lastName;
  final String nickname;

  const RegisterEntity({
    required this.id,
    required this.name,
    required this.lastName,
    required this.nickname,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        lastName,
        nickname,
      ];
}
