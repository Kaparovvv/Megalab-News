import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FavoritesEntity extends Equatable {
  FavoritesEntity({
    this.userId,
    this.postId,
  });

  int? userId;
  int? postId;
  @override
  List<Object?> get props => [userId, postId];
}
