import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_state.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/deitals_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/deitals_state.dart';
import 'package:ecom/features/view_prodect/presentation/pages/product_ditails.dart';
import 'package:ecom/features/view_prodect/presentation/widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatogeryVe extends StatefulWidget {
  final int catid;

  const CatogeryVe({Key? key, required this.catid}) : super(key: key);

  @override
  _CatogeryVState createState() => _CatogeryVState();
}

class _CatogeryVState extends State<CatogeryVe> {
  late int? cateogryId;

  @override
  void initState() {
    cateogryId = widget.catid;

    BlocProvider.of<CatogryCubit>(context).getCatogry();
    BlocProvider.of<DeitalsCubit>(
      context,
    ).getDietals(cateogryId!.toString(), "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,

      extendBodyBehindAppBar: true,

      appBar: AppBar(
        elevation: 16,
        toolbarHeight: 80,
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(title: SizedBox(height: 200)),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,

        automaticallyImplyLeading: false,
        title: Container(
          width: 350,
          height: 45,
          // margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.black.withAlpha(30),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: TextField(
            onChanged: (value) {
              if (value.isEmpty) {
              } else {
                BlocProvider.of<DeitalsCubit>(
                  context,
                ).getDietals("", value.toString());
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hint: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    "Search in here",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(style: BorderStyle.none),
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(style: BorderStyle.none),
              ),
            ),
          ),
        ),
        // centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        children: [
          BlocBuilder<CatogryCubit, CatogryState>(
            builder: (context, state) {
              if (state is CatogryLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(top: 130.0),
                  child: Categoryv(state: state, t: false),
                );
              }
              return Text("loading ..");
            },
          ),
          Container(
            height: 700,
            child: CustomScrollView(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              slivers: [
                BlocBuilder<DeitalsCubit, DeitalsState>(
                  builder: (context, state) {
                    if (state is DeitalsLoaded) {
                      return SliverGrid.builder(
                        itemCount: state.deitals!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProductDitails(
                                    id: state.deitals![index]!.id,
                                    title: state.deitals![index]!.productName,
                                    img: state.deitals![index]!.productImg,
                                    colors: state.deitals![index]!.color,
                                    size: state.deitals![index]!.size,
                                    descrption: state
                                        .deitals![index]!
                                        .productDescribtion,
                                    price: state.deitals![index]!.price,
                                    reviw: state.deitals![index]!.reveiw,
                                    cateogryId: state.deitals![index]!.catId,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Card(
                                borderOnForeground: true,
                                //margin: EdgeInsets.all(value),
                                color: Colors.white,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                      child: CachedNetworkImage(
                                        height:
                                            MediaQuery.sizeOf(context).height /
                                            5,

                                        width:
                                            MediaQuery.sizeOf(context).width /
                                            2,
                                        fit: BoxFit.fill,
                                        imageUrl:
                                            ProductUrl.imgurl +
                                            state
                                                .deitals![index]!
                                                .productImg![0]
                                                .toString(),
                                      ),
                                    ),
                                    //  SizedBox(height: 10),
                                    ListTile(
                                      contentPadding: EdgeInsetsDirectional.all(
                                        10,
                                      ),

                                      title: Text(
                                        "${state.deitals![index]!.productName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "\$ ${state.deitals![index]!.price} .00",
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
                                                  state
                                                          .deitals![index]!
                                                          .reveiw! <
                                                      3.5
                                                  ? Colors.orange
                                                  : Color.fromARGB(
                                                      85,
                                                      76,
                                                      175,
                                                      79,
                                                    ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.star, size: 13),
                                                Text(
                                                  "${state.deitals![index]!.reveiw}",
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
                          );
                        },
                      );
                    }
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  },
                ),

                SliverToBoxAdapter(child: SizedBox(height: 200)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
