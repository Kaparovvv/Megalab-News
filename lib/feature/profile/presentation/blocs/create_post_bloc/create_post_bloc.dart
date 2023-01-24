import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/create_post_entity.dart';

import '../../../../../utils/dependencies_export.dart';
import '../../../../../utils/dependencies_injection.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatePost createPost;
  CreatePostBloc({required this.createPost}) : super(CreatePostInitial()) {
    on<CreateNewsPostEvent>((event, emit) async {
      emit(LoadingCreatePostState());
      final result = await createPost(
        CreatePostParams(
          title: event.title,
          text: event.text,
          image: event.image,
          tag: event.tag,
          shortDesc: event.shortDesc,
        ),
      );

      result.fold(
        (failure) => emit(
          ErrorCreatePostState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (createPost) => emit(
          LoadedCreatePostState(createPostEntity: createPost),
        ),
      );
    });
  }
}
