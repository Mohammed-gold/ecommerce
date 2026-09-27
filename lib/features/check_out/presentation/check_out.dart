import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/core/colors/colors_from_hex.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_item_cubit.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_item_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOut extends StatefulWidget {
  final List cartItem;
  final total;
  const CheckOut({Key? key, required this.cartItem, this.total})
    : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selectindx2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Container(
        padding: EdgeInsets.all(18),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(54, 158, 158, 158),
              ),
              height: 160,
              width: 300,
              child: Stack(
                children: [
                  Positioned(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Address",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mohammed Hisham Nassir",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Algreef sharg, sharrg alneel ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Khartoum,Sudan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "+249 117416861",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Change",
                            style: TextStyle(fontSize: 13, color: Colors.purple),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Summary",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.cartItem.length} items",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(104, 189, 188, 188),
                borderRadius: BorderRadius.circular(8),
              ),

              height: 150,
              width: 200,
              child: BlocBuilder<CartItemCubit, CartItemStatus>(
                builder: (context, state) => ListView.builder(
                  itemCount: widget.cartItem.isEmpty
                      ? 0
                      : widget.cartItem.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(top: 7),

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(172, 255, 255, 255),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(5),
                          child: CachedNetworkImage(
                            width: 100,
                            height: 95,
                            fit: BoxFit.fill,
                            imageUrl:
                                ProductUrl.imgurl +
                                "${widget.cartItem[index]['ecommerce_data']['product_img'][0]}",
                          ),
                        ),
                        SizedBox(width: 13),
                        SizedBox(width: 85,
                          child: Column(mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.cartItem[index]["ecommerce_data"]["product_name"]}",
                                style: TextStyle(fontSize: 13),
                              ),
                              Row(
                                children: [
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
                                      "${widget.cartItem[index]['colors'][0]}",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "quantity :",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    " ${widget.cartItem[index]["quantity"]}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 70),
                        Text(
                          " \$${widget.cartItem[index]['ecommerce_data']['price']}.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Shipping Method",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),

            ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectindx2 = index;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: selectindx2 == index
                                ? Colors.purple
                                : Color.fromARGB(255, 194, 189, 189),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectindx2 == index
                                ? Colors.purple
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),

                      Image.asset(
                        "assets/cash2.png",
                        fit: BoxFit.fill,
                        color: selectindx2 == index
                            ? Colors.purple
                            : Colors.grey,
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      index == 0
                          ? Column(
                              children: [
                                Text(
                                  "Standard Delivery",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  " 4 - 5 hours",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  "Express Delivery",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  " 1 - 2 hours",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(width: 44),
                      index == 0
                          ? Text(
                              "\$3.00",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: selectindx2 == index
                                    ? Colors.purple
                                    : Colors.grey,
                              ),
                            )
                          : Text(
                              "\$6.00",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: selectindx2 == index
                                    ? Colors.purple
                                    : Colors.grey,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height / 33),
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
                      "Price Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal (${widget.cartItem.length} items)",
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
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping",
                          style: TextStyle(fontSize: 12),
                        ),
                      selectindx2 == 0?  Text(
                          "\$3.00",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ):Text(
                          "\$6.00",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      selectindx2 == 0?  Text(
                          "\$${BlocProvider.of<CartItemCubit>(context).all_total+3}.00",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ):Text(
                          "\$${BlocProvider.of<CartItemCubit>(context).all_total+6}.00",
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

            SizedBox(height: MediaQuery.sizeOf(context).height / 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: Colors.purple,
                ),
                onPressed: () {
                  
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      "Place order",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
