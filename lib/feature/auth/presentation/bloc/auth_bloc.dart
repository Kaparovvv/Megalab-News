import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/core/error/failure_to_message.dart';
import 'package:megalab_news_app/feature/auth/domain/usecases/auth_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUser authUser;
  AuthBloc({required this.authUser}) : super(AuthInitial()) {
    on<AuthUserEvent>((event, emit) async {
      final failureToMessage = FailureToMessage();
      emit(LoadingAuthState());

      final result = await authUser(
        AuthUserParams(
          nickname: event.nickname,
          password: event.password,
        ),
      );

      result.fold(
        (failure) => emit(ErrorAuthState(
          message: failureToMessage.mapFailureToMessage(failure),
        )),
        (userToken) => emit(
          LoadedAuthState(),
        ),
      );
    });
  }
}
