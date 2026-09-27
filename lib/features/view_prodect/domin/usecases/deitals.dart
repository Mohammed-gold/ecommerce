import 'package:ecom/features/view_prodect/domin/entities/productEnitity.dart';
import 'package:ecom/features/view_prodect/domin/repositories/product_repositoy_interface.dart';

class Deitalsusecase {
  final ProductRepositoyInterface productRepositoyInterface;
  Deitalsusecase(this.productRepositoyInterface);

  Future<List<Productenitity?>?> getDeitals(String id, String name) async {
    return await productRepositoyInterface.getdeitals(id, name);
  }
}
