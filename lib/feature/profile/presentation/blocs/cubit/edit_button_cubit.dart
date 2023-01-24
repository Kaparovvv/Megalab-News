import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_button_state.dart';

class EditButtonCubit extends Cubit<EditButtonState> {
  EditButtonCubit() : super(EditButtonInitial());

  saveUserData() => emit(SaveUserDataState());
  editUserdata() => emit(EditUserDataState());
}
