import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignupLoaded extends SignupState {}

class SignupLoading extends SignupState {}

class Signupinti extends SignupState {}

class SignupError extends SignupState {
  final String messg;
  SignupError({required this.messg});
  @override
  // TODO: implement props
  List<Object?> get props => [messg];
}
