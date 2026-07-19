import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_state.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/discount_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/discount_state.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/product_state.dart';
import 'package:ecom/features/view_prodect/presentation/widgets/headtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: d!,
        onTap: (value) {
          setState(() {
            d = value;
          });
        },

        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: Icon(Icons.category_outlined),
          ),
          BottomNavigationBarItem(
            label: "ggg",
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: "ggg",
            icon: Icon(Icons.person_2_outlined),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        toolbarHeight: 80,
        flexibleSpace: FlexibleSpaceBar(title: SizedBox(height: 20)),
        animateColor: true,
        backgroundColor: Colors.white,
        // centerTitle: true,
        title: SizedBox(
          height: MediaQuery.sizeOf(context).height / 17,
          width: MediaQuery.sizeOf(context).width,
          child: FloatingActionButton(
            backgroundColor: Colors.grey[200],

            isExtended: true,
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(width: 15),
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 5),
                Text("Search in here", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: BlocBuilder<DiscountCubit, DiscountState>(
              builder: (context, state) {
                if (state is Discountloaded) {
                  return SizedBox(
                    height: 200,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
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

                              Text(
                                " 50% off",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                ),
                              ),
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
          SliverToBoxAdapter(child: Headtitel(head: "Cateogry ")),
          SliverToBoxAdapter(child: SizedBox(height: 15)),
          BlocBuilder<CatogryCubit, CatogryState>(
            builder: (context, state) {
              if (state is CatogryLoaded) {
                return SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 200,
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,

                      itemCount: state.catogry!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        childAspectRatio: 0.5,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) => Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            width: MediaQuery.sizeOf(context).width / 1.7,
                            height: MediaQuery.sizeOf(context).width / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    "${ProductUrl.imgurl + state.catogry![index]!.img}",
                              ),
                            ),
                          ),
                          Positioned(
                            left: 22,
                            top: 6,
                            child: Text(
                              "${state.catogry![index]!.name}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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

          SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverToBoxAdapter(child: Headtitel(head: "All Product")),

          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoaded) {
                return SliverToBoxAdapter(
                  child: MasonryGridView.builder(
                    padding: EdgeInsetsGeometry.all(20),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemCount: state.Product?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: (index / 2) == 0
                          ? EdgeInsets.only(top: 60)
                          : EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Card(
                            child: CachedNetworkImage(
                              height: MediaQuery.sizeOf(context).height / 3.8,
                              width: 200,
                              fit: BoxFit.fill,
                              imageUrl:
                                  ProductUrl.imgurl +
                                  state.Product![index]!.productImg.toString(),
                            ),
                          ),
                          //  SizedBox(height: 10),
                          ListTile(
                            title: Text(
                              "${state.Product![index]!.productName}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            subtitle: Text("\$ ${state.Product![index]!.id}"),
                          ),
                          SizedBox(height: 40),
                        ],
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
        ],
      ),
    );
  }
}
