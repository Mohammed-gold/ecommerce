import 'package:ecom/features/view_prodect/data/repositories/product_repositories.dart';
import 'package:ecom/features/view_prodect/domin/entities/discount.dart';
import 'package:ecom/features/view_prodect/domin/entities/catogry.dart';

import 'package:ecom/features/view_prodect/domin/entities/productEnitity.dart';

abstract class ProductRepositoyInterface {
  ProductRepositories productRepositories = ProductRepositories();
  Future<List<Catogry?>?> getcatogry() async {
    return await productRepositories.getcatogry();
  }

  Future<List<Discount?>?> getdiscount() async {
    return await productRepositories.getdiscount();
  }

  Future<List<Productenitity?>?> getentity() async {
    var g = await productRepositories.getentity();
    return g;
  }

  Future<List<Productenitity?>?> getdeitals(String id, String name) async {
    var g = await productRepositories.getdeitals(id, name);
    return g;
  }
}
