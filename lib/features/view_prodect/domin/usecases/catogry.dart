import 'package:ecom/features/view_prodect/data/repositories/product_repositories.dart';
import 'package:ecom/features/view_prodect/domin/entities/catogry.dart';
import 'package:ecom/features/view_prodect/domin/repositories/product_repositoy_interface.dart';

class CatogryUsecase {
  final ProductRepositoyInterface productRepositoyInterface =
      ProductRepositories();

  Future<List<Catogry?>?> getproduct() async {
    return await productRepositoyInterface.getcatogry();
  }
}
