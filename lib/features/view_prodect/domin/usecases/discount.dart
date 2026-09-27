import 'package:ecom/features/view_prodect/data/repositories/product_repositories.dart';
import 'package:ecom/features/view_prodect/domin/entities/discount.dart';
import 'package:ecom/features/view_prodect/domin/repositories/product_repositoy_interface.dart';

class Discountusecase {
  final ProductRepositoyInterface productRepositoyInterface =
      ProductRepositories();

  Future<List<Discount?>?>? getdiscount() async {
    return await productRepositoyInterface.getdiscount();
  }
}
