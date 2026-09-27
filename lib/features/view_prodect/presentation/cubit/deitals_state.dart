import 'package:ecom/features/view_prodect/domin/entities/productEnitity.dart';
import 'package:equatable/equatable.dart';

class DeitalsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeitalsLoading extends DeitalsState {
  DeitalsLoading();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeitalsLoaded extends DeitalsState {
  final List<Productenitity?>? deitals;
  DeitalsLoaded({required this.deitals});
  @override
  // TODO: implement props
  List<Object?> get props => [deitals];
}

class DeitalsError extends DeitalsState {
  final String messge;

  DeitalsError({required this.messge});
}
