import 'package:equatable/equatable.dart';

class SigninState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final String massage;

  SigninSuccess({required this.massage});
}

class SigninError extends SigninState {
  final String? massage;
  SigninError({required this.massage});
}
