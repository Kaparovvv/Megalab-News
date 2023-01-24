part of 'user_data_bloc.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object> get props => [];
}

class GetUserDataEvent extends UserDataEvent {}

class PutUserDataEvent extends UserDataEvent {
  final String name;
  final String lastName;
  final String nickName;
  final File? profileImage;

  const PutUserDataEvent({
    required this.name,
    required this.lastName,
    required this.nickName,
    this.profileImage,
  });
}
