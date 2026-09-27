import 'package:ecom/features/cart/presentation/cubit/cart_item_status.dart';
import 'package:ecom/features/cart/presentation/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartItemCubit extends Cubit<CartItemStatus> {
  CartItemCubit() : super(CartItemStatusInitial());
  SupabaseClient supabase = Supabase.instance.client;

  var total;
  //var shiping = 10;
  var all_total;
  var id;
  var quantity;

  Future<void> getCartId() async {
    try {
      id = await supabase
          .from('carts')
          .select('id')
          .eq('user_id', "${supabase.auth.currentUser?.id}")
          .single();
      print("=======================$id");
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCartItem() async {
    emit(CartItemStatusLoading());
    try {
      final response = await supabase
          .from('cart_items')
          .select('''
        id,
        product_id,
        quantity,
        size,colors,
        created_at,
      cart_id,
      ecommerce_data(
       product_name
       ,product_img,price,reveiw,colors,Size
      )
      ''')
          .eq('userid', "${supabase.auth.currentUser?.id}");
      print(response);

      if (response.isNotEmpty) {
        emit(CartItemStatusSuccess(cartItems: response));
        total = 0;
        for (final item in response) {
          total +=
              (item['ecommerce_data']['price'] as num) *
              (item['quantity'] as num);
        }
        all_total = 0;
        all_total = total ;
      } else if (response.isEmpty) {
        emit(CartItemStatusSuccess(cartItems: []));
        emit(CartItemStatusInitial());
      }
    } catch (e) {
      print("======================00000000${e}");
      emit(CartItemStatusError(massage: e.toString()));
    }
  }

  insertCartItem({
    required int productId,
    required int quantity,
    required String size,
    required String colora,
    required BuildContext context,
  }) async {
    emit(CartItemStatusLoading());
    try {
      if (id.isNotEmpty) {
        final response = await supabase.from('cart_items').upsert({
          'product_id': productId,
          'quantity': quantity,
          'cart_id': id['id'],
          'size': [size],
          'colors': [colora],
        }, onConflict: "product_id");
        print("=======================insertttt");

        // emit(CartItemStatusSuccess(cartItems: response));
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => Cart()));
      }
    } catch (e) {
      print("Error inserting cart item: $e");
      emit(CartItemStatusError(massage: e.toString()));
    }
  }

  Future<void> deletItem({var productid, required List item, index}) async {
    emit(CartItemStatusLoading());
    final a = item;
    a.removeAt(index);
    total = 0;
    for (final items in a) {
      total +=
          (items['ecommerce_data']['price'] as num) *
          (items['quantity'] as num);
    }
    all_total = 0;
    all_total = total ;
    emit(CartItemStatusSuccess(cartItems: a));

    var res = await supabase
        .from('cart_items')
        .delete()
        .eq('product_id', productid)
        .eq('userid', '${supabase.auth.currentUser?.id}');
    print("=============================deletttt");
  }

  Future<void> deleItem({var productid, required List item, index}) async {
    emit(CartItemStatusLoading());
  
    final a = item;

    final b = a[index];
    if (b['quantity'] as num > 1) {
        
      a[index]['quantity'] = a[index]['quantity'] -1;

       total = 0;
    for (final items in a) {
      total +=
          (items['ecommerce_data']['price'] as num) *
          (items['quantity'] as num);
    }
    all_total = 0;
    all_total = total ;
 emit(CartItemStatusSuccess(cartItems: a));
 
    
    }else{a.removeAt(index);
     emit(CartItemStatusSuccess(cartItems: a));
    }

   

   
    print("=============================minnnnitem ");
  }
   Future<void> deleeItem({var productid, required List item, index}) async {
    
  
    final a = item;

    final b = a[index];
    if (b['quantity'] as num > 1) {
 
  var res = await supabase
        .from('cart_items')
        .update({'quantity': ( item[index]['quantity'] as num) -1})
        .eq('product_id', productid)
        .eq('userid', '${supabase.auth.currentUser?.id}');
     
    
    }else{a.removeAt(index);
     emit(CartItemStatusSuccess(cartItems: a));
    }

   

   
    print("=============================minnnnitem ");
  }

  Future<void> additem({var productid, required List item, index}) async {
    emit(CartItemStatusLoading());
    final a = item;

    final b = a[index];
    if (b['quantity'] as num >= 1) {
         total = 0;
    for (final items in a) {
       a[index]['quantity'] = a[index]['quantity'] +1;
      total +=
          (items['ecommerce_data']['price'] as num) *
          (items['quantity'] as num);
    }
    all_total = 0;
    all_total = total ;
     
    }

    emit(CartItemStatusSuccess(cartItems: a));
 

    print("=============================adddddddd ");
  }


   Future<void> addditem({var productid, required List item, index}) async {
   
    
   
 var res = await supabase
        .from('cart_items')
        .update({'quantity': ( item[index]['quantity'] as num) + 1})
        .eq('product_id', productid)
        .eq('userid', '${supabase.auth.currentUser?.id}');
    print("=============================adddddddd ");
  }
}
