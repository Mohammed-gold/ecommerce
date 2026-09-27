import 'package:equatable/equatable.dart';

class CartItemStatus extends Equatable {
  const CartItemStatus();

  @override
  List<Object?> get props => [];
}

class CartItemStatusInitial extends CartItemStatus {
  CartItemStatusInitial();
}

class CartItemStatusLoading extends CartItemStatus {
  CartItemStatusLoading();
}

class CartItemStatusSuccess extends CartItemStatus {
  final List cartItems;

  CartItemStatusSuccess({required this.cartItems});
  @override
  List<Object?> get props => [cartItems];
}

class CartItemStatusError extends CartItemStatus {
  final String? massage;

  @override
  List<Object?> get props => [massage];
  CartItemStatusError({this.massage});
}
