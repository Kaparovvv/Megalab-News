part of 'tag_list_bloc.dart';

abstract class TagListEvent extends Equatable {
  const TagListEvent();

  @override
  List<Object> get props => [];
}

class GetTagListEvent extends TagListEvent {}
