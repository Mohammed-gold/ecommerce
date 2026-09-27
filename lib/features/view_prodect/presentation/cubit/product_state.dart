import 'package:ecom/features/view_prodect/domin/entities/productEnitity.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Productenitity?>? Product;

  ProductLoaded({required this.Product});
  @override
  List<Object?> get props => [Product];
}

class ProductError extends ProductState {
  final String Massge;
  ProductError({required this.Massge});
  @override
  List<Object?> get props => [Massge];
}
