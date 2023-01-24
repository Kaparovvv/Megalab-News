part of 'create_post_bloc.dart';

abstract class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class CreateNewsPostEvent extends CreatePostEvent {
  final String title;
  final String text;
  final File? image;
  final String tag;
  final String shortDesc;

  const CreateNewsPostEvent({
    required this.title,
    required this.text,
    this.image,
    required this.tag,
    required this.shortDesc,
  });
}
