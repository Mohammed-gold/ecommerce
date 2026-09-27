import 'package:ecom/features/view_prodect/data/repositories/product_repositories.dart';
import 'package:ecom/features/view_prodect/domin/entities/productEnitity.dart';
import 'package:ecom/features/view_prodect/domin/repositories/product_repositoy_interface.dart';

class Getproductusecase {
  final ProductRepositoyInterface productRepositoyInterface =
      ProductRepositories();
  Getproductusecase();
  Future<List<Productenitity?>?> getproduct() async {
    print(
      "mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm${productRepositoyInterface.getentity()}",
    );
    return await productRepositoyInterface.getentity();
  }
}
