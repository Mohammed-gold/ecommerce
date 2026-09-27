import 'package:ecom/features/view_prodect/domin/entities/productEnitity.dart';
import 'package:ecom/features/view_prodect/domin/usecases/deitals.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/deitals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeitalsCubit extends Cubit<DeitalsState> {
  DeitalsCubit(this.deitalsUsecase) : super(DeitalsLoading());
  Deitalsusecase deitalsUsecase;

  Future<List<Productenitity?>?> getDietals(String id, String name) async {
    emit(DeitalsLoaded(deitals: List.empty()));
    try {
      emit(DeitalsLoaded(deitals: await deitalsUsecase.getDeitals(id, name)));
    } catch (e) {
      emit(DeitalsError(messge: e.toString()));
    }
  }
}
