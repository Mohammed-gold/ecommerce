import 'package:ecom/features/view_prodect/domin/entities/catogry.dart';
import 'package:ecom/features/view_prodect/domin/usecases/catogry.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatogryCubit extends Cubit<CatogryState> {
  CatogryCubit(this.catogryUsecase) : super(CatogryLoading());
  CatogryUsecase catogryUsecase;

  getCatogry() async {
    try {
      emit(CatogryLoaded(catogry: await catogryUsecase.getproduct()));
    } catch (e) {
      emit(CatogryError(messg: e.toString()));
    }
  }
}
