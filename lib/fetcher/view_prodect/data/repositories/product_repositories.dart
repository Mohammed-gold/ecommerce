import 'package:ecom/fetcher/view_prodect/data/datasources/get_allproduct.dart';
import 'package:ecom/fetcher/view_prodect/data/model/Productmodel.dart';

import 'package:ecom/fetcher/view_prodect/domin/entities/productEnitity.dart';
import 'package:ecom/fetcher/view_prodect/domin/repositories/product_repositoy_interface.dart';

class ProductRepositories implements ProductRepositoyInterface {
  GetAllproduct product = GetAllproduct();

  @override
  late ProductRepositories productRepositories;

  @override
  Future<List<Productenitity?>?> getentity() async {
    List<Productmodel?>? getallproduct = await product.getProduct();

    var x = getallproduct!
        .map(
          (e) => Productenitity(
            id: e?.id,
            productname: e?.title,
            ProductPrice: e?.price,
            imag: e?.images,
            category: e!.category,
          ),
        )
        .toList();
    return x;
  }
}
