import 'package:equatable/equatable.dart';

class UserTokenEntity extends Equatable {
  final String token;

  const UserTokenEntity({required this.token});

  @override
  List<Object?> get props => [token];
}
