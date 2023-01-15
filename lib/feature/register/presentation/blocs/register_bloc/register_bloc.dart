import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';
import 'package:megalab_news_app/feature/register/domain/usecases/register_user.dart';
part 'register_event.dart';
part 'register_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;
  RegisterBloc(this.registerUser) : super(RegisterInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(LoadingRegisterState());

      final result = await registerUser(
        UserDataParams(
          nickname: event.nickname,
          name: event.name,
          lastName: event.lastName,
          profileImage: event.profileImage,
          password: event.password,
          password2: event.password2,
        ),
      );

      result.fold(
        (failure) =>
            emit(ErrorRegisterState(message: _mapFailureToMessage(failure))),
        (userData) => emit(
          LoadedRegisterState(userEntity: userData),
        ),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
