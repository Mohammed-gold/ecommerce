import 'package:ecom/features/view_prodect/domin/entities/catogry.dart';
import 'package:equatable/equatable.dart';

class CatogryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CatogryLoading extends CatogryState {
  CatogryLoading();
}

class CatogryLoaded extends CatogryState {
  final List<Catogry?>? catogry;

  CatogryLoaded({required this.catogry});
  @override
  // TODO: implement props
  List<Object?> get props => [catogry];
}

class CatogryError extends CatogryState {
  final String messg;

  CatogryError({required this.messg});
  @override
  // TODO: implement props
  List<Object?> get props => [messg];
}
