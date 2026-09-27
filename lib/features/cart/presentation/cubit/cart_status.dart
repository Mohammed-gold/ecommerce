import 'package:equatable/equatable.dart';

class CartStatus extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartStatusLoading extends CartStatus {}

class CartStatusSuccess extends CartStatus {}

class CartStatusError extends CartStatus {
  final String? massage;
  CartStatusError({required this.massage});
  @override
  // TODO: implement props
  List<Object?> get props => [massage];
}
