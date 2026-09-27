import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/core/colors/colors_from_hex.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_item_cubit.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_item_status.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_status.dart';
import 'package:ecom/features/cart/presentation/pages/cart.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/deitals_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/deitals_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class ProductDitails extends StatefulWidget {
  final int? id;

  final int? cateogryId;
  final String? title;
  final double? reviw;
  final int? price;
  final String? descrption;
  final List<String>? img;
  final List<String>? colors;
  final List<String>? size;
  ProductDitails({
    Key? key,
    required this.id,
    required this.title,
    this.img,
    this.reviw,
    this.price,
    this.descrption,
    this.colors,
    this.size,
    this.cateogryId,
  }) : super(key: key);

  @override
  State<ProductDitails> createState() => _ProductDitailsState();
}

class _ProductDitailsState extends State<ProductDitails> {
  late int id;
  late int catoegryId;
  int? selectindx;
  int? selectindx2;
  bool selectindx3 = false;
  late String? titl;
  late List<String>? img;
  late List<String>? Size;
  late List<String>? color;
  late String? descrbtion;
  late double? reveiw;
  late int? price;
  String? sizea;
  String? coloraas;

  getd(id) async {
    await BlocProvider.of<DeitalsCubit>(context).getDietals(id.toString(), "");
    await BlocProvider.of<CartItemCubit>(context).getCartId();
    await BlocProvider.of<CartItemCubit>(context).getCartItem();
    
  }

  @override
  void initState() {
    id = widget.id!;
    catoegryId = widget.cateogryId!;
    titl = widget.title;
    img = widget.img;
    descrbtion = widget.descrption;
    reveiw = widget.reviw;
    price = widget.price;
    color = widget.colors;
    Size = widget.size!;
    getd(catoegryId);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.white,
        shape: CircularNotchedRectangle(inverted: true),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CartItemCubit, CartItemStatus>(
              builder: (context, k) {
                return MaterialButton(
                  // splashColor: Colors.red,

                  // padding: EdgeInsets.all(20),
                  height: 100,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 231, 226, 226),
                    ),
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),

                  onPressed: () {
                    print("=============================000000$sizea");
                    print("=============================000000$coloraas");
                    context.read<CartCubit>().insertcart();
                    if (sizea == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("You must choose Size")),
                      );
                    } else if( coloraas == null){ ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("You must choose Color")),
                            );}else{
                       if(k is CartItemStatusSuccess){
                        print("999999999999999999999999999999");
                              for(final a in k.cartItems ){
                               int b=0;
                               b++;
                               if( a['product_id']as num == id.toInt()){
                                 BlocProvider.of<CartItemCubit>(context).addditem(item: k.cartItems,index: 0,
                              productid: id,
                             
                            );
                               }else{  
                              
                              BlocProvider.of<CartItemCubit>(context).insertCartItem(
                              productId: id,
                              quantity: 1,
                              size: sizea!,
                              colora: coloraas!,
                              context: context,
                            );}
                     
                              }
                             

                            }else{  
                              
                              BlocProvider.of<CartItemCubit>(context).insertCartItem(
                              productId: id,
                              quantity: 1,
                              size: sizea!,
                              colora: coloraas!,
                              context: context,
                            );}
                     
                        
                         
                    }

                    // context.read<CartItemCubit>().insertCartItem(id, 1);
                  },

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 10),
                      Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(width: 15),
            MaterialButton(
              color: Colors.purple,
              // padding: EdgeInsets.all(20),
              height: 100,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: const Color.fromARGB(255, 231, 226, 226),
                ),
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              onPressed: () {
                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_bag_rounded, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // shrinkWrap: true,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,

            // pinned: true,
            backgroundColor: const Color.fromARGB(204, 0, 0, 0),
            floating: false,
            expandedHeight: MediaQuery.sizeOf(context).height / 2.3,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: img!.length,
                    itemBuilder: (context, index) => SizedBox(
                      height: MediaQuery.sizeOf(context).height / 2.0,
                      child: CachedNetworkImage(
                        filterQuality: FilterQuality.high,
                        useOldImageOnUrlChange: true,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        fit: BoxFit.fill,

                        imageUrl: "${ProductUrl.imgurl + img![index]}",
                      ),
                    ),
                  ),

                  Positioned(
                    top: 30,
                    left: 15,
                    right: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          heroTag: 0,
                          backgroundColor: Colors.white,
                          mini: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(30),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),

                        FloatingActionButton(
                          heroTag: 5,
                          backgroundColor: Colors.white,
                          mini: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(30),
                          ),
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),));
                          
                          },
                          child: Icon(Icons.shopping_cart_outlined, size: 17),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverAppBar(
            // primary: true,
            foregroundColor: Colors.white,
            floating: true,
            surfaceTintColor: Colors.white,
            excludeHeaderSemantics: false,

            // expandedHeight: 10,
            pinned: true,
            expandedHeight: 23,
            toolbarHeight: 10,
            //  collapsedHeight: 15,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(
                start: 14,
                top: 20,
                bottom: 5,
              ),
              title: Text(
                titl!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Row(
              children: [
                SizedBox(width: 15),
                Icon(Icons.star, size: 15, color: Colors.orange),
                SizedBox(width: 3),
                Text(
                  reveiw.toString(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Text(
                  "|",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 224, 223, 223),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "\$" + price.toString() + ".00",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
              child: Text(
                "Color",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 12, right: 12),
              width: 36,
              height: 36,
              child: ListView.builder(
                itemCount: color!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectindx2 = index;
                    });
                    if (selectindx2 == index) {
                      coloraas = color![selectindx2!];
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        width: 2,
                        color: selectindx2 == index
                            ? Colors.black
                            : Color.fromARGB(255, 194, 189, 189),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: hextToColor(color![index]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 8),
              child: Text(
                "Size",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: Size!.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectindx = index;
                    });
                    if (selectindx == index) {
                      sizea = Size![index].toString();
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),

                    height: 27,
                    width: 36,
                    decoration: BoxDecoration(
                      color: selectindx == index ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: const Color.fromARGB(255, 218, 214, 214),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        Size![index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectindx == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 20, right: 15),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 12),
              child: ReadMoreText(
                descrbtion!,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                trimLines: 3,
                colorClickableText: const Color.fromARGB(255, 178, 38, 202),
                trimMode: TrimMode.Line,
                trimCollapsedText: " Read more",
                trimExpandedText: "  less",
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13.0,
                vertical: 10,
              ),
              child: Text(
                "You may also like",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          BlocBuilder<DeitalsCubit, DeitalsState>(
            builder: (context, state) {
              if (state is DeitalsLoaded) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,

                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.deitals!.length,
                      itemBuilder: (context, index) =>
                          id == state.deitals![index]!.id
                          ? Container()
                          : Card(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductDitails(
                                        id: state.deitals![index]!.id,
                                        title:
                                            state.deitals![index]!.productName,
                                        img: state.deitals![index]!.productImg,
                                        colors: state.deitals![index]!.color,
                                        size: state.deitals![index]!.size,
                                        descrption: state
                                            .deitals![index]!
                                            .productDescribtion,
                                        price: state.deitals![index]!.price,
                                        reviw: state.deitals![index]!.reveiw,
                                        cateogryId:
                                            state.deitals![index]!.catId,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                      child: SizedBox(
                                        height: 120,
                                        width: 150,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl:
                                              ProductUrl.imgurl +
                                              state
                                                  .deitals![index]!
                                                  .productImg![0]
                                                  .toString(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.deitals![index]!.productName
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "\$" +
                                                state.deitals![index]!.price
                                                    .toString() +
                                                ".00",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                255,
                                                112,
                                                110,
                                                110,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // ListTile(
                                    //   title: Text(
                                    //     state.deitals![index]!.productName.toString(),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                );
              }
              return SliverToBoxAdapter(child: CircularProgressIndicator());
            },
          ),
          // SliverToBoxAdapter(child: SizedBox(height: 700)),
        ],
      ),
    );
  }
}
