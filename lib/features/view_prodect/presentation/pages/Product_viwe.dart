import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/features/view_prodect/presentation/pages/product_ditails.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_state.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/discount_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/discount_state.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/product_state.dart';
import 'package:ecom/features/view_prodect/presentation/widgets/appbar.dart';
import 'package:ecom/features/view_prodect/presentation/widgets/bottom_Navigation_appbar.dart';
import 'package:ecom/features/view_prodect/presentation/widgets/category.dart';
import 'package:ecom/features/view_prodect/presentation/widgets/headtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductViwe extends StatefulWidget {
  @override
  State<ProductViwe> createState() => _ProductViweState();
}

class _ProductViweState extends State<ProductViwe> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getproduct();
    BlocProvider.of<CatogryCubit>(context).getCatogry();
    BlocProvider.of<DiscountCubit>(context).getdiscount();

    super.initState();
  }

  int? d = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationAppbarv(),
      backgroundColor: Colors.white,
      appBar: Appbarv(context),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: BlocBuilder<DiscountCubit, DiscountState>(
              builder: (context, state) {
                if (state is Discountloaded) {
                  return SizedBox(
                    height: 170,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        pauseAutoPlayOnManualNavigate: true,

                        autoPlay: true,
                        // aspectRatio: 0.2,
                        viewportFraction: 1,
                      ), // infinite: true,

                      itemCount: state.discounts?.length,
                      itemBuilder: (context, index, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            bottom: 20,
                            // left: 10,
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.sizeOf(context).height / 2,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      offset: Offset.fromDirection(2),
                                      spreadRadius: 1,
                                    ),
                                  ],

                                  color: const Color.fromARGB(153, 78, 23, 42),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              CachedNetworkImage(
                                height: MediaQuery.sizeOf(context).height / 4,
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.fill,
                                imageUrl:
                                    ProductUrl.imgurl +
                                    state.discounts![index]!.discountImag
                                        .toString(),
                              ),

                              // Text(
                              //   " 50% off",
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 50,
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is DiscountError) {
                  return Center(child: Icon(Icons.nearby_error));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: Headtitel(head: "Cateogrys ")),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          BlocBuilder<CatogryCubit, CatogryState>(
            builder: (context, state) {
              if (state is CatogryLoaded) {
                return SliverToBoxAdapter(
                  child: Categoryv(state: state, t: true),
                );
              } else if (state is CatogryError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text("${state.messg}")),
                );
              }
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),

          // SliverToBoxAdapter(child: SizedBox(height: 5)),
          SliverToBoxAdapter(child: Headtitel(head: "All Products")),
          SliverToBoxAdapter(child: SizedBox(height: 14)),

          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoaded) {
                return SliverGrid.builder(
                  // padding: EdgeInsetsGeometry.all(20),
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                  ),
                  // SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  // crossAxisCount: 2,
                  // ),
                  itemCount: state.Product?.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDitails(
                              id: state.Product![index]!.id,
                              title: state.Product![index]!.productName,
                              img: state.Product![index]!.productImg,
                              colors: state.Product![index]!.color,
                              size: state.Product![index]!.size,
                              descrption:
                                  state.Product![index]!.productDescribtion,
                              price: state.Product![index]!.price,
                              reviw: state.Product![index]!.reveiw,
                              cateogryId: state.Product![index]!.catId,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        borderOnForeground: true,
                        //margin: EdgeInsets.all(value),
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              child: CachedNetworkImage(
                                height: MediaQuery.sizeOf(context).height / 5,

                                width: MediaQuery.sizeOf(context).width / 2,
                                fit: BoxFit.fill,
                                imageUrl:
                                    ProductUrl.imgurl +
                                    state.Product![index]!.productImg![0]
                                        .toString(),
                              ),
                            ),
                            //  SizedBox(height: 10),
                            ListTile(
                              contentPadding: EdgeInsetsDirectional.all(10),

                              title: Text(
                                "${state.Product![index]!.productName}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "\$ ${state.Product![index]!.price} .00",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //  SizedBox(width: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          state.Product![index]!.reveiw! < 3.5
                                          ? Colors.orange
                                          : Color.fromARGB(85, 76, 175, 79),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.star, size: 13),
                                        Text(
                                          "${state.Product![index]!.reveiw}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
          SliverToBoxAdapter(child: SizedBox(height: 70)),
        ],
      ),
    );
  }
}
