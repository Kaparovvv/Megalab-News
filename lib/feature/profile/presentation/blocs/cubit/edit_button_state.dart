part of 'edit_button_cubit.dart';

abstract class EditButtonState extends Equatable {
  const EditButtonState();

  @override
  List<Object> get props => [];
}

class EditButtonInitial extends EditButtonState {}

class EditUserDataState extends EditButtonState {}

class SaveUserDataState extends EditButtonState {}
