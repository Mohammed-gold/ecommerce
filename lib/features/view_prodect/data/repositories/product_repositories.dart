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
            price: e.price,
            reveiw: e.reveiw,
            color: e.colors,
            size: e.size,
            productName: e.productName,
            catId: e.catogreId,
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

  @override
  Future<List<Productenitity?>?> getdeitals(String id, String name) async {
    var deitals = await product.getdeitals(id, name);
    return deitals!
        .map(
          (e) => Productenitity(
            createdAt: e.createdAt,
            id: e.id,
            price: e.price,
            productDescribtion: e.productDescribtion,
            productImg: e.productImg,
            productName: e.productName,
            reveiw: e.reveiw,
            color: e.colors,
            size: e.size,
            catId: e.catogreId,
          ),
        )
        .toList();
  }
}
