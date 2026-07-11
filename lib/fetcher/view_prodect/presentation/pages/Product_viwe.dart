import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/fetcher/view_prodect/data/datasources/get_allproduct.dart';
import 'package:ecom/fetcher/view_prodect/presentation/cubit/product_cubit.dart';
import 'package:ecom/fetcher/view_prodect/presentation/cubit/product_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViwe extends StatefulWidget {
  @override
  State<ProductViwe> createState() => _ProductViweState();
}

class _ProductViweState extends State<ProductViwe> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getproduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("ecommerce")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductError) {
              Center(child: Text("Error"));
            } else if (state is ProductLoaded) {
              return Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.Product!.length - 1,

                        itemBuilder: (context, index) {
                          if (state.Product![index]!.imag![0] ==
                                  "https://placeimg.com/640/480/any" ||
                              state.Product![index]!.imag![0] ==
                                  "http://image1.png" ||
                              state.Product![index]!.imag![0] ==
                                  "https://placehold.co/600x400") {
                            return Container(
                              margin: EdgeInsets.only(
                                left: MediaQuery.sizeOf(context).width / 20,
                              ),
                              height: MediaQuery.sizeOf(context).width / 10,
                              width: MediaQuery.sizeOf(context).width / 1,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Text("${state.Product![index]!.imag![0]}"),
                            );
                          } else {
                            return Container(
                              width: MediaQuery.sizeOf(context).width,
                              padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CachedNetworkImage(
                                // width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.fill,
                                imageUrl: "${state.Product![index]!.imag![0]}",
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Text(
                    "Category",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Flexible(
                    flex: 1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 5),
                        Column(
                          children: [
                            Icon(Icons.sports_basketball),
                            Text("Sport"),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(children: [Icon(Icons.laptop), Text("Laptop")]),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Icon(Icons.sports_gymnastics_rounded),
                            Text("gym"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 15,
                      ),
                      shrinkWrap: true,
                      itemCount: state.Product!.length,
                      itemBuilder: (context, index) => Card(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10, top: 5),
                                height: MediaQuery.sizeOf(context).height / 6,
                                width: MediaQuery.sizeOf(context).width / 2,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      "${state.Product![index]!.imag![0]}",
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Text(
                                  "${state.Product![index]!.productname}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,

                                children: [
                                  Text("Price :"),
                                  Text(
                                    "\$ ${state.Product![index]!.ProductPrice}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
