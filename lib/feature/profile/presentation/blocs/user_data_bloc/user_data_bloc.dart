import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_data_entity.dart';

import '../../../../../utils/dependencies_export.dart';
import '../../../../../utils/dependencies_injection.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final PutUserData putUserData;
  final GetUserData getUserData;
  UserDataBloc({
    required this.getUserData,
    required this.putUserData,
  }) : super(UserDataInitial()) {
    on<GetUserDataEvent>((event, emit) async {
      emit(LoadingGetUserDataState());
      final result = await getUserData();

      result.fold(
        (failure) => emit(
          ErrorGetUserDataState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (userData) => emit(
          LoadedGetUserDataState(userDataEntity: userData),
        ),
      );
    });

    on<PutUserDataEvent>((event, emit) async {
      emit(LoadingPutUserDataState());
      final result = await putUserData(
        PutUserDataParams(
          nickname: event.nickName,
          name: event.name,
          lastName: event.lastName,
          profileImage: event.profileImage,
        ),
      );

      result.fold(
        (failure) => emit(
          ErrorPutUserDataState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (userData) => emit(
          LoadedPutUserDataState(userDataEntity: userData),
        ),
      );
    });
  }
}
