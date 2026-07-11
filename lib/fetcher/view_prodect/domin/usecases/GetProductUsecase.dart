import 'package:ecom/fetcher/view_prodect/data/repositories/product_repositories.dart';
import 'package:ecom/fetcher/view_prodect/domin/entities/productEnitity.dart';
import 'package:ecom/fetcher/view_prodect/domin/repositories/product_repositoy_interface.dart';

class Getproductusecase {
  final ProductRepositoyInterface productRepositoyInterface =
      ProductRepositories();
  Getproductusecase();
  Future<List<Productenitity?>?> getproduct() async {
    return productRepositoyInterface.getentity();
  }
}
