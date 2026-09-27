import 'package:ecom/features/view_prodect/domin/entities/productEnitity.dart';
import 'package:ecom/features/view_prodect/domin/usecases/GetProductUsecase.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.getproductusecase) : super(ProductLoading());
  Getproductusecase getproductusecase;

  getproduct() async {
    try {
      emit(ProductLoaded(Product: await getproductusecase.getproduct()));
    } catch (e) {
      emit(ProductError(Massge: e.toString()));
    }
  }
}
