part of 'checkbox_cubit.dart';

abstract class CheckboxState extends Equatable {
  const CheckboxState();

  @override
  List<Object> get props => [];
}

class CheckboxInitial extends CheckboxState {}

class CheckedState extends CheckboxState {}

class UncheckedState extends CheckboxState {}
