import 'package:ecom/features/view_prodect/domin/entities/discount.dart';
import 'package:equatable/equatable.dart';

class DiscountState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Discountloading extends DiscountState {
  Discountloading();
}

class Discountloaded extends DiscountState {
  final List<Discount?>? discounts;
  @override
  // TODO: implement props
  List<Object?> get props => [discounts];

  Discountloaded({required this.discounts});
}

class DiscountError extends DiscountState {
  final String messge;

  DiscountError({required this.messge});
}
