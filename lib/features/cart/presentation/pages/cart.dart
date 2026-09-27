import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/core/colors/colors_from_hex.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_item_cubit.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_item_status.dart';
import 'package:ecom/features/check_out/presentation/check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // int total = 0;
  //int alltotal = 0;
  int shipping = 10;
  getcart() async {
    await BlocProvider.of<CartItemCubit>(context).getCartItem();
    //  alltotal = BlocProvider.of<CartItemCubit>(context).total + shipping;
  }

  @override
  void initState() {
    getcart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 251, 253),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Cart'),
        backgroundColor: const Color.fromARGB(255, 253, 251, 253),
      ),
      body: BlocBuilder<CartItemCubit, CartItemStatus>(
        builder: (context, s) {
          if (s is CartItemStatusSuccess) {
            return s.cartItems.isEmpty || s.cartItems == null
                ? Center(
                    child: Text(
                      "Cart is Empty ..",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView(
                    children: [
                      SizedBox(
                        height: 450,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: s.cartItems!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0.3,
                              margin: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                      child: CachedNetworkImage(
                                        width: 100,
                                        height: 95,
                                        fit: BoxFit.fill,
                                        imageUrl:
                                            ProductUrl.imgurl +
                                            "${s.cartItems![index]['ecommerce_data']['product_img'][0]}",
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${s.cartItems![index]['ecommerce_data']['product_name']}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Size : ${s.cartItems![index]['size'][0]}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            " | ",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Color :  ",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            color: hextToColor(
                                              "${s.cartItems![index]['colors'][0]}",
                                            ),
                                          ),
                                        ],
                                      ),

                                      Container(
                                        height: 24,
                                        padding: EdgeInsets.all(0),
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                253,
                                                253,
                                              ),
                                              offset: Offset(10, 10),
                                              blurRadius: 3,
                                              spreadRadius: 2,
                                              blurStyle: BlurStyle.inner,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                              255,
                                              231,
                                              228,
                                              228,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          spacing: 0,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () {

                                                BlocProvider.of<CartItemCubit>(
                                                  context,
                                                ).addditem(
                                                  item: s.cartItems,
                                                  index: index,
                                                  productid: s
                                                      .cartItems[index]['product_id'],
                                                );
                                                BlocProvider.of<CartItemCubit>(
                                                  context,
                                                ).additem(
                                                  item: s.cartItems,
                                                  index: index,
                                                  productid: s
                                                      .cartItems[index]['product_id'],
                                                ); 
                                              },
                                              icon: Icon(Icons.add, size: 13),
                                            ),
                                            Text(
                                              ' ${s.cartItems[index]['quantity']}',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () {
                                                if( s.cartItems[index]['quantity'] as num <=1){BlocProvider.of<CartItemCubit>(context).deletItem(item: s.cartItems,index: index,productid: s
                                                      .cartItems[index]['product_id']);}else{ 
                                                         BlocProvider.of<CartItemCubit>(
                                                  context,
                                                ).deleeItem(
                                                  item: s.cartItems,
                                                  index: index,
                                                  productid: s
                                                      .cartItems[index]['product_id'],
                                                );
                                                        BlocProvider.of<CartItemCubit>(
                                                  context,
                                                ).deleItem(
                                                  item: s.cartItems,
                                                  index: index,
                                                  productid: s
                                                      .cartItems[index]['product_id'],
                                                );}
                                               
                                               
                                              },
                                              icon: Icon(
                                                Icons.remove,
                                                size: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 28),
                                  Column(
                                    children: [
                                      Text(
                                        " \$${s.cartItems![index]['ecommerce_data']['price']}.00",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.purple,
                                          fontSize: 14,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await BlocProvider.of<CartItemCubit>(
                                            context,
                                          ).deletItem(
                                            item: s.cartItems!,
                                            index: index,
                                            productid: s
                                                .cartItems![index]['product_id'],
                                          );
                                          //     await BlocProvider.of<CartItemCubit>(
                                          //     context,
                                          // ).getCartItem();
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height / 10,),
                      Card(
                        color: Colors.white,
                        elevation: 0.3,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 7,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Summary",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal (${s.cartItems.length} items)",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "\$${BlocProvider.of<CartItemCubit>(context).total}.00",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text(
                              //       "Shipping",
                              //       style: TextStyle(fontSize: 12),
                              //     ),
                              //     Text(
                              //       "\$$shipping.00",
                              //       style: TextStyle(
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "\$${BlocProvider.of<CartItemCubit>(context).all_total}.00",
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: MediaQuery.sizeOf(context).height / 28,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                            backgroundColor: Colors.purple,
                          ),
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut(cartItem: s.cartItems,total:BlocProvider.of<CartItemCubit>(context).total),))
                          ;},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_outline, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                "Proceed to Checkout",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
          }
          if (s is CartItemStatusInitial) {
            return Center(child: Icon(Icons.import_contacts));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
