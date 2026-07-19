import 'package:dio/dio.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/features/view_prodect/data/model/Discount.dart';
import 'package:ecom/features/view_prodect/data/model/Productmodel.dart';
import 'package:ecom/features/view_prodect/data/model/catogry.dart';

class GetAllproduct {
  late Dio dio;
  GetAllproduct() {
    BaseOptions options = BaseOptions(
      headers: {"apikey": "sb_publishable_DnyBNo-YK3pHqQEPHqdK2w_Ja03CCdf"},
    );
    dio = Dio(options);
  }

  Future<List<Catogrymodel>?> getcatogry() async {
    Response response = await dio.get(ProductUrl.catogry);
    // print(response);

    List<Catogrymodel> catogrylist = [];
    if (response.statusCode == 200) {
      var d = response.data;
      d.forEach((e) => catogrylist.add(Catogrymodel.fromJson(e)));
      return catogrylist;
    }
    return null;
  }

  Future<List<Home>?> getProduct() async {
    Response response = await dio.get(ProductUrl.data);
    // print(response);

    List<Home> Items = [];
    if (response.statusCode == 200) {
      var d = response.data;
      d.forEach((e) => Items.add(Home.fromJson(e)));
      return Items;
    }
    return null;

    // return null;
  }

  Future<List<Discont>?> getdiscount() async {
    Response response = await dio.get(ProductUrl.discount);
    // print(response);

    List<Discont> disconts = [];
    if (response.statusCode == 200) {
      var d = response.data;
      d.forEach((e) => disconts.add(Discont.fromJson(e)));
      return disconts;
    }
    return null;

    // return null;
  }
}
