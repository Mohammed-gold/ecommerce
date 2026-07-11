import 'package:dio/dio.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/fetcher/view_prodect/data/model/Productmodel.dart';

class GetAllproduct {
  late Dio dio;
  GetAllproduct() {
    BaseOptions options = BaseOptions(
      receiveTimeout: Duration(seconds: 15),
      headers: {"x-rapidapi-key": ProductUrl.Apikey},
    );
    dio = Dio(options);
  }

  getProduct() async {
    try {
      Response response = await dio.get(ProductUrl.baseUrl);

      if (response.statusCode == 200) {
        var r = (response.data as List)
            .map((e) => Productmodel.fromJson(e))
            .toList();
        print("$r==============================");
        return r;
      }
    } catch (e) {
      print("$e=======");
      //return [];
    }
    // return null;
  }
}
