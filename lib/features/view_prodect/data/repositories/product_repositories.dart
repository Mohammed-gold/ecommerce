import 'package:ecom/features/view_prodect/data/datasources/get_allproduct.dart';

import 'package:ecom/features/view_prodect/domin/entities/discount.dart';

import 'package:ecom/features/view_prodect/domin/entities/catogry.dart';

import 'package:ecom/features/view_prodect/domin/entities/productEnitity.dart';
import 'package:ecom/features/view_prodect/domin/repositories/product_repositoy_interface.dart';

class ProductRepositories implements ProductRepositoyInterface {
  GetAllproduct product = GetAllproduct();

  @override
  late ProductRepositories productRepositories;

  @override
  Future<List<Productenitity?>?> getentity() async {
    var getallproduct = await product.getProduct();

    print("from rep iiiiiiiiiii$getallproduct");
    var x = getallproduct!
        .map(
          (e) => Productenitity(
            createdAt: e.createdAt,
            id: e.id,
            productDescribtion: e.productDescribtion,
            productImg: e.productImg,
            productName: e.productName,
          ),
        )
        .toList();
    print("xxxxxxxxxxxxxxxxxxxxxxxxxx$x");
    return x;
  }

  @override
  Future<List<Catogry?>?> getcatogry() async {
    var getcatogry = await product.getcatogry();
    return getcatogry!
        .map((e) => Catogry(id: e.id!, name: e.name!, img: e.imag!))
        .toList();
  }

  @override
  Future<List<Discount?>?> getdiscount() async {
    var getdiscount = await product.getdiscount();
    return getdiscount!
        .map(
          (e) => Discount(
            categoryId: e.categoryId,
            createdAt: e.createdAt,
            discount: e.discount,
            discountImag: e.discountImag,
            id: e.id,
            itemId: e.itemId,
          ),
        )
        .toList();
  }
}
