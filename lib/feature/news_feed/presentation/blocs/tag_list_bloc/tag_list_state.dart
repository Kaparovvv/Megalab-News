part of 'tag_list_bloc.dart';

abstract class TagListState extends Equatable {
  const TagListState();

  @override
  List<Object> get props => [];
}

class TagListInitial extends TagListState {}

class LoadingTagListState extends TagListState {}

class LoadedTagListState extends TagListState {
  final List<TagListEntity> tagList;

  const LoadedTagListState({required this.tagList});
}

class ErrorTagListState extends TagListState {
  final String message;

  const ErrorTagListState({required this.message});
}
