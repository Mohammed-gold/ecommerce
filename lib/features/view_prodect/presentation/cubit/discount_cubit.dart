import 'package:ecom/features/view_prodect/domin/usecases/discount.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/discount_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscountCubit extends Cubit<DiscountState> {
  DiscountCubit(this.discount) : super(Discountloading());
  Discountusecase discount;
  Future<void> getdiscount() async {
    try {
      emit(Discountloaded(discounts: await discount.getdiscount()));
    } catch (e) {
      emit(DiscountError(messge: e.toString()));
    }
  }
}
