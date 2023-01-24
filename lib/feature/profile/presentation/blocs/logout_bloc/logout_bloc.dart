import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_logout_entity.dart';

import '../../../../../utils/dependencies_export.dart';
import '../../../../../utils/dependencies_injection.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final UserLogout logout;
  LogoutBloc({required this.logout}) : super(LogoutInitial()) {
    on<UserLogoutEvent>((event, emit) async {
      emit(LoadingLogoutState());
      final result = await logout();
      result.fold(
        (failure) => emit(
          ErrorLogoutState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (logoutEntity) => emit(
          LoadedLogoutState(logoutEntity: logoutEntity),
        ),
      );
    });
  }
}
