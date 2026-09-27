import 'package:dio/dio.dart';
import 'package:ecom/core/const/url.dart';

class InCart {
  late Dio dio;
  InCart() {
    BaseOptions options = BaseOptions(
      headers: {"apikey": "sb_publishable_DnyBNo-YK3pHqQEPHqdK2w_Ja03CCdf"},
    );
    dio = Dio(options);
  }

  Future<void> insertcart(int status, String userId) async {
    Response response = await dio.post(
      "https://lxxjhxibpktdbffsgxgf.supabase.co/rest/v1/carts",
      // queryParameters: {"statous": status, "user_id": userId},
      data: {"statous": 2, "user_id": userId},
    );
    print(response.data);
  }
}
