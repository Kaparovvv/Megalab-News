import 'package:equatable/equatable.dart';

class DeletePostEntity extends Equatable {
  final bool isDelete;

  const DeletePostEntity({required this.isDelete});

  @override
  List<Object?> get props => [isDelete];
}
