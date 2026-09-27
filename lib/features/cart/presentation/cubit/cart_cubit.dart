import 'package:dio/dio.dart';
import 'package:ecom/features/cart/data/datasource/in_cart.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartCubit extends Cubit<CartStatus> {
  CartCubit() : super(CartStatus());

  // InCart inCart = InCart();
  var supabase = Supabase.instance.client.auth.currentUser;

  insertcart() async {
    emit(CartStatusLoading());
    if (supabase != null) {
      var supabasea = Supabase.instance.client;
      try {
        // await inCart.insertcart(1, supabase!.id);
        final response = await supabasea.from('carts').upsert({
          "statous": 1,
          "user_id": supabase!.id,
        }, onConflict: "user_id");
        // print(supabase!.id);

        emit(CartStatusSuccess());
      } catch (e) {
        print(supabase!.id);
        emit(CartStatusError(massage: e.toString()));
      }
    } else {
      print("user is null");
    }
  }
}
