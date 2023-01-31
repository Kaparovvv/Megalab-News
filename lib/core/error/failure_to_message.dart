import 'package:megalab_news_app/core/error/failure.dart';

import '../../commons/names_helper.dart';

class FailureToMessage {
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return NamesHelper.serverFailureMessage;
      case CacheFailure:
        return NamesHelper.cacheFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
