import 'package:equatable/equatable.dart';

class UserLogoutEntity extends Equatable {
  final bool isLogout;

  const UserLogoutEntity({required this.isLogout});

  @override
  List<Object?> get props => [isLogout];
}
