import 'package:ecom/fetcher/view_prodect/data/repositories/product_repositories.dart';

import 'package:ecom/fetcher/view_prodect/domin/entities/productEnitity.dart';

abstract class ProductRepositoyInterface {
  ProductRepositories productRepositories = ProductRepositories();
  Future<List<Productenitity?>?> getentity() async {
    var g = await productRepositories.getentity();
    return g;
  }
}
