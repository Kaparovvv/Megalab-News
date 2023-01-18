import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure_to_message.dart';
import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';
import 'package:megalab_news_app/feature/register/domain/usecases/register_user.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;
  RegisterBloc({required this.registerUser}) : super(RegisterInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      final failureToMessage = FailureToMessage();
      emit(LoadingRegisterState());

      final result = await registerUser(
        UserDataParams(
          nickname: event.nickname,
          name: event.name,
          lastName: event.lastName,
          // profileImage: event.profileImage,
          password: event.password,
          password2: event.password2,
        ),
      );

      result.fold(
        (failure) => emit(
          ErrorRegisterState(
            message: (failureToMessage.mapFailureToMessage(failure)),
          ),
        ),
        (userData) => emit(
          LoadedRegisterState(userEntity: userData),
        ),
      );
    });
  }
}
